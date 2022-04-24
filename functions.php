add_actions('rest_api_init', 'wp_rest_user_endponts');

function wp_rest_user_endponts($request) {
    register_rest_route('wp/v2', 'user/register', array(
        'methods' => "POST",
        'callback' => 'wc_rest_endpoint_handler'
    ));
}

funtion wc_rest_user_endpoint_handler($request = null) {

    $response = array();
    $parameters = $request->get_json_params();
    $username = sanitize_text_field($parameters['username']);
    $email = sanitize_text_field($parameters['email']);
    $password = sanitize_text_field($parameters['password']);

    $error = new WP_Error();
    if(empty($username)) {
        $error->add(400, __("username field 'username' is require", 'wp-rest-user'),
        array('status'=>400));
        return $error;
    }
    if(empty($email)) {
        $error->add(401, __("username field 'email' is require", 'wp-rest-user'),
        array('status'=>401));
        return $error;
    }
    if(empty($password)) {
        $error->add(404, __("username field 'password' is require", 'wp-rest-user'),
        array('status'=>404));
        return $error;
    }
     $user_id = username_exist($username);
     if(!$user_id && email_exists($email) == false) {
         $user_id = wp_create_user($username, $password, $email);
         
            if(!is_wp_error($user_id)) {
                $user = get_user_by('id', $user_id);
                $user->set_role('subscriber');
            
                if(class_exist('wooCommerce')) {
                    $user->set_role('customer');
            }
            $response['code'] = 200;
            $response['message'] = __("user'" . $username . "' Regitration was Successfull", "wp-rest-user");
        }
        else {
            return $user_id;
        }
    }
    else {
        $error=>add(406, __("Email/Username already exists", "wp-rest-user"), array ('status'=>400));
        return $error;
    }
    return new WP_REST_Response($response, 123);
}