// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.yoastHead,
    this.yoastHeadJson,
    this.links,
  });

  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  ProductModelType type;
  Status status;
  bool featured;
  CatalogVisibility catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  TaxStatus taxStatus;
  TaxClass taxClass;
  bool manageStock;
  dynamic stockQuantity;
  Backorders backorders;
  bool backordersAllowed;
  bool backordered;
  dynamic lowStockAmount;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  PurchaseNote purchaseNote;
  List<Category> categories;
  List<dynamic> tags;
  List<Image> images;
  List<Attribute> attributes;
  List<dynamic> defaultAttributes;
  List<dynamic> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  String priceHtml;
  List<int> relatedIds;
  List<MetaDatum> metaData;
  StockStatus stockStatus;
  String yoastHead;
  YoastHeadJson yoastHeadJson;
  Links links;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: productModelTypeValues.map[json["type"]],
        status: statusValues.map[json["status"]],
        featured: json["featured"],
        catalogVisibility:
            catalogVisibilityValues.map[json["catalog_visibility"]],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: taxStatusValues.map[json["tax_status"]],
        taxClass: taxClassValues.map[json["tax_class"]],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: backordersValues.map[json["backorders"]],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: purchaseNoteValues.map[json["purchase_note"]],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        defaultAttributes:
            List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: List<dynamic>.from(json["variations"].map((x) => x)),
        groupedProducts:
            List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
        metaData: List<MetaDatum>.from(
            json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: stockStatusValues.map[json["stock_status"]],
        yoastHead: json["yoast_head"],
        yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "type": productModelTypeValues.reverse[type],
        "status": statusValues.reverse[status],
        "featured": featured,
        "catalog_visibility":
            catalogVisibilityValues.reverse[catalogVisibility],
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": List<dynamic>.from(downloads.map((x) => x)),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatusValues.reverse[taxStatus],
        "tax_class": taxClassValues.reverse[taxClass],
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backordersValues.reverse[backorders],
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
        "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNoteValues.reverse[purchaseNote],
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "default_attributes":
            List<dynamic>.from(defaultAttributes.map((x) => x)),
        "variations": List<dynamic>.from(variations.map((x) => x)),
        "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
        "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
        "stock_status": stockStatusValues.reverse[stockStatus],
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson.toJson(),
        "_links": links.toJson(),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: List<String>.from(json["options"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options": List<dynamic>.from(options.map((x) => x)),
      };
}

enum Backorders { NO }

final backordersValues = EnumValues({"no": Backorders.NO});

enum CatalogVisibility { VISIBLE }

final catalogVisibilityValues =
    EnumValues({"visible": CatalogVisibility.VISIBLE});

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  Name name;
  Slug slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]],
        slug: slugValues.map[json["slug"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "slug": slugValues.reverse[slug],
      };
}

enum Name { ITA_PUBLICATIONS, THE_28_ADAPTED_BOOKS }

final nameValues = EnumValues({
  "ITA Publications": Name.ITA_PUBLICATIONS,
  "28 Adapted Books": Name.THE_28_ADAPTED_BOOKS
});

enum Slug { ITAPUBLICATIONS, THE_28_ADAPTED_BOOKS }

final slugValues = EnumValues({
  "itapublications": Slug.ITAPUBLICATIONS,
  "28-adapted-books": Slug.THE_28_ADAPTED_BOOKS
});

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  String length;
  String width;
  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class Image {
  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  Collection({
    this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  int id;
  String key;
  String value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

enum PurchaseNote { EMPTY, P_INTRODUCTORY_PRICE_P }

final purchaseNoteValues = EnumValues({
  "": PurchaseNote.EMPTY,
  "<p>Introductory Price</p>\n": PurchaseNote.P_INTRODUCTORY_PRICE_P
});

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum StockStatus { INSTOCK }

final stockStatusValues = EnumValues({"instock": StockStatus.INSTOCK});

enum TaxClass { EMPTY, ZERO_RATE }

final taxClassValues =
    EnumValues({"": TaxClass.EMPTY, "zero-rate": TaxClass.ZERO_RATE});

enum TaxStatus { TAXABLE, NONE }

final taxStatusValues =
    EnumValues({"none": TaxStatus.NONE, "taxable": TaxStatus.TAXABLE});

enum ProductModelType { SIMPLE }

final productModelTypeValues = EnumValues({"simple": ProductModelType.SIMPLE});

class YoastHeadJson {
  YoastHeadJson({
    this.title,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articlePublisher,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.schema,
    this.twitterMisc,
  });

  String title;
  Robots robots;
  String canonical;
  OgLocale ogLocale;
  OgType ogType;
  String ogTitle;
  String ogDescription;
  String ogUrl;
  OgSiteName ogSiteName;
  String articlePublisher;
  DateTime articleModifiedTime;
  List<OgImage> ogImage;
  TwitterCard twitterCard;
  Schema schema;
  TwitterMisc twitterMisc;

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        robots: Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: ogLocaleValues.map[json["og_locale"]],
        ogType: ogTypeValues.map[json["og_type"]],
        ogTitle: json["og_title"],
        ogDescription:
            json["og_description"] == null ? null : json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: ogSiteNameValues.map[json["og_site_name"]],
        articlePublisher: json["article_publisher"],
        articleModifiedTime: json["article_modified_time"] == null
            ? null
            : DateTime.parse(json["article_modified_time"]),
        ogImage: List<OgImage>.from(
            json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: twitterCardValues.map[json["twitter_card"]],
        schema: Schema.fromJson(json["schema"]),
        twitterMisc: json["twitter_misc"] == null
            ? null
            : TwitterMisc.fromJson(json["twitter_misc"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots.toJson(),
        "canonical": canonical,
        "og_locale": ogLocaleValues.reverse[ogLocale],
        "og_type": ogTypeValues.reverse[ogType],
        "og_title": ogTitle,
        "og_description": ogDescription == null ? null : ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteNameValues.reverse[ogSiteName],
        "article_publisher": articlePublisher,
        "article_modified_time": articleModifiedTime == null
            ? null
            : articleModifiedTime.toIso8601String(),
        "og_image": List<dynamic>.from(ogImage.map((x) => x.toJson())),
        "twitter_card": twitterCardValues.reverse[twitterCard],
        "schema": schema.toJson(),
        "twitter_misc": twitterMisc == null ? null : twitterMisc.toJson(),
      };
}

class OgImage {
  OgImage({
    this.width,
    this.height,
    this.url,
    this.path,
    this.size,
    this.id,
    this.alt,
    this.pixels,
    this.type,
  });

  int width;
  int height;
  String url;
  String path;
  Size size;
  int id;
  String alt;
  int pixels;
  OgImageType type;

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        path: json["path"],
        size: sizeValues.map[json["size"]],
        id: json["id"],
        alt: json["alt"],
        pixels: json["pixels"],
        type: ogImageTypeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "path": path,
        "size": sizeValues.reverse[size],
        "id": id,
        "alt": alt,
        "pixels": pixels,
        "type": ogImageTypeValues.reverse[type],
      };
}

enum Size { FULL }

final sizeValues = EnumValues({"full": Size.FULL});

enum OgImageType { IMAGE_JPEG, IMAGE_PNG }

final ogImageTypeValues = EnumValues(
    {"image/jpeg": OgImageType.IMAGE_JPEG, "image/png": OgImageType.IMAGE_PNG});

enum OgLocale { EN_US }

final ogLocaleValues = EnumValues({"en_US": OgLocale.EN_US});

enum OgSiteName { IDARA_E_TALEEM_O_AAGAHI_ITA_PUBLICATIONS }

final ogSiteNameValues = EnumValues({
  "Idara-e-Taleem-o-Aagahi (ITA) - Publications":
      OgSiteName.IDARA_E_TALEEM_O_AAGAHI_ITA_PUBLICATIONS
});

enum OgType { ARTICLE }

final ogTypeValues = EnumValues({"article": OgType.ARTICLE});

class Robots {
  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  Index index;
  Follow follow;
  MaxSnippet maxSnippet;
  MaxImagePreview maxImagePreview;
  MaxVideoPreview maxVideoPreview;

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: indexValues.map[json["index"]],
        follow: followValues.map[json["follow"]],
        maxSnippet: maxSnippetValues.map[json["max-snippet"]],
        maxImagePreview: maxImagePreviewValues.map[json["max-image-preview"]],
        maxVideoPreview: maxVideoPreviewValues.map[json["max-video-preview"]],
      );

  Map<String, dynamic> toJson() => {
        "index": indexValues.reverse[index],
        "follow": followValues.reverse[follow],
        "max-snippet": maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreviewValues.reverse[maxVideoPreview],
      };
}

enum Follow { FOLLOW }

final followValues = EnumValues({"follow": Follow.FOLLOW});

enum Index { INDEX }

final indexValues = EnumValues({"index": Index.INDEX});

enum MaxImagePreview { MAX_IMAGE_PREVIEW_LARGE }

final maxImagePreviewValues = EnumValues(
    {"max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE});

enum MaxSnippet { MAX_SNIPPET_1 }

final maxSnippetValues =
    EnumValues({"max-snippet:-1": MaxSnippet.MAX_SNIPPET_1});

enum MaxVideoPreview { MAX_VIDEO_PREVIEW_1 }

final maxVideoPreviewValues =
    EnumValues({"max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1});

class Schema {
  Schema({
    this.context,
    this.graph,
  });

  String context;
  List<Graph> graph;

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": List<dynamic>.from(graph.map((x) => x.toJson())),
      };
}

class Graph {
  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.description,
    this.potentialAction,
    this.inLanguage,
    this.contentUrl,
    this.width,
    this.height,
    this.caption,
    this.isPartOf,
    this.primaryImageOfPage,
    this.datePublished,
    this.dateModified,
    this.breadcrumb,
    this.itemListElement,
  });

  GraphType type;
  String id;
  String url;
  String name;
  OgSiteName description;
  List<PotentialAction> potentialAction;
  InLanguage inLanguage;
  String contentUrl;
  int width;
  int height;
  String caption;
  Breadcrumb isPartOf;
  Breadcrumb primaryImageOfPage;
  DateTime datePublished;
  DateTime dateModified;
  Breadcrumb breadcrumb;
  List<ItemListElement> itemListElement;

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: graphTypeValues.map[json["@type"]],
        id: json["@id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null
            ? null
            : ogSiteNameValues.map[json["description"]],
        potentialAction: json["potentialAction"] == null
            ? null
            : List<PotentialAction>.from(json["potentialAction"]
                .map((x) => PotentialAction.fromJson(x))),
        inLanguage: json["inLanguage"] == null
            ? null
            : inLanguageValues.map[json["inLanguage"]],
        contentUrl: json["contentUrl"] == null ? null : json["contentUrl"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        caption: json["caption"] == null ? null : json["caption"],
        isPartOf: json["isPartOf"] == null
            ? null
            : Breadcrumb.fromJson(json["isPartOf"]),
        primaryImageOfPage: json["primaryImageOfPage"] == null
            ? null
            : Breadcrumb.fromJson(json["primaryImageOfPage"]),
        datePublished: json["datePublished"] == null
            ? null
            : DateTime.parse(json["datePublished"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        breadcrumb: json["breadcrumb"] == null
            ? null
            : Breadcrumb.fromJson(json["breadcrumb"]),
        itemListElement: json["itemListElement"] == null
            ? null
            : List<ItemListElement>.from(json["itemListElement"]
                .map((x) => ItemListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": graphTypeValues.reverse[type],
        "@id": id,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "description":
            description == null ? null : ogSiteNameValues.reverse[description],
        "potentialAction": potentialAction == null
            ? null
            : List<dynamic>.from(potentialAction.map((x) => x.toJson())),
        "inLanguage":
            inLanguage == null ? null : inLanguageValues.reverse[inLanguage],
        "contentUrl": contentUrl == null ? null : contentUrl,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "caption": caption == null ? null : caption,
        "isPartOf": isPartOf == null ? null : isPartOf.toJson(),
        "primaryImageOfPage":
            primaryImageOfPage == null ? null : primaryImageOfPage.toJson(),
        "datePublished":
            datePublished == null ? null : datePublished.toIso8601String(),
        "dateModified":
            dateModified == null ? null : dateModified.toIso8601String(),
        "breadcrumb": breadcrumb == null ? null : breadcrumb.toJson(),
        "itemListElement": itemListElement == null
            ? null
            : List<dynamic>.from(itemListElement.map((x) => x.toJson())),
      };
}

class Breadcrumb {
  Breadcrumb({
    this.id,
  });

  String id;

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

enum InLanguage { EN_US }

final inLanguageValues = EnumValues({"en-US": InLanguage.EN_US});

class ItemListElement {
  ItemListElement({
    this.type,
    this.position,
    this.name,
    this.item,
  });

  ItemListElementType type;
  int position;
  String name;
  String item;

  factory ItemListElement.fromJson(Map<String, dynamic> json) =>
      ItemListElement(
        type: itemListElementTypeValues.map[json["@type"]],
        position: json["position"],
        name: json["name"],
        item: json["item"] == null ? null : json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": itemListElementTypeValues.reverse[type],
        "position": position,
        "name": name,
        "item": item == null ? null : item,
      };
}

enum ItemListElementType { LIST_ITEM }

final itemListElementTypeValues =
    EnumValues({"ListItem": ItemListElementType.LIST_ITEM});

class PotentialAction {
  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  PotentialActionType type;
  dynamic target;
  QueryInput queryInput;

  factory PotentialAction.fromJson(Map<String, dynamic> json) =>
      PotentialAction(
        type: potentialActionTypeValues.map[json["@type"]],
        target: json["target"],
        queryInput: json["query-input"] == null
            ? null
            : queryInputValues.map[json["query-input"]],
      );

  Map<String, dynamic> toJson() => {
        "@type": potentialActionTypeValues.reverse[type],
        "target": target,
        "query-input":
            queryInput == null ? null : queryInputValues.reverse[queryInput],
      };
}

enum QueryInput { REQUIRED_NAME_SEARCH_TERM_STRING }

final queryInputValues = EnumValues({
  "required name=search_term_string":
      QueryInput.REQUIRED_NAME_SEARCH_TERM_STRING
});

class TargetClass {
  TargetClass({
    this.type,
    this.urlTemplate,
  });

  TargetType type;
  String urlTemplate;

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: targetTypeValues.map[json["@type"]],
        urlTemplate: json["urlTemplate"],
      );

  Map<String, dynamic> toJson() => {
        "@type": targetTypeValues.reverse[type],
        "urlTemplate": urlTemplate,
      };
}

enum TargetType { ENTRY_POINT }

final targetTypeValues = EnumValues({"EntryPoint": TargetType.ENTRY_POINT});

enum PotentialActionType { SEARCH_ACTION, READ_ACTION }

final potentialActionTypeValues = EnumValues({
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType { WEB_SITE, IMAGE_OBJECT, WEB_PAGE, BREADCRUMB_LIST }

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "ImageObject": GraphType.IMAGE_OBJECT,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard { SUMMARY_LARGE_IMAGE }

final twitterCardValues =
    EnumValues({"summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE});

class TwitterMisc {
  TwitterMisc({
    this.estReadingTime,
  });

  String estReadingTime;

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        estReadingTime: json["Est. reading time"],
      );

  Map<String, dynamic> toJson() => {
        "Est. reading time": estReadingTime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
