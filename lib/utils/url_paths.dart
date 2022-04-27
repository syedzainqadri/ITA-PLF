const basUrl =
    "https://clfbooks.childrensliteraturefestival.com/wp-json/wc/v3/";

const getProducts = "products";
//products?category=
const getCategories = "products/categories";
const getAllMethods = "payment_gateways";
const createUserApi = "users";
const makeOrder = "orders";
enum UrlPath {
  about,
  plfAdvisor,
  plfTarana,

  ambassadors,
  resourcePersons,
  childProdigies,
  partnerOrganization,
  corePartners,
  influencers,
  strands,
  incredibleLibraries,
  digitalKutab,
  kitabGarri,
  youngAuthorAward,
  yAA2022Launch,
  yAA2021Winners,
  yAA1920Winners,
  yAA1920Members,
  yAAFaqs,
  onlineBookClub,
  languageTeaches,
  storyBytes,
  artCraftTherapy,
  digitalLearningFestivals,
  plfPublications,
  plfUpComings,
  plfWorkshops,
  campaigns,
  schoolReadingProgram,
  plfActivities,

  // buttons urls
  tarana,
  poster,
  sponsors,
  program,
  resourcePerson,
  gallery,
  media,
  getInvolved,
  testimonials,
  venue,
  registration,
  videos,
  bookLaunches,
}

class UrlPathHelper {
  static String getValue(UrlPath path) {
    switch (path) {
      case UrlPath.about:
        return "/about/";

      case UrlPath.plfAdvisor:
        return "/clf-advisors/";

      case UrlPath.plfTarana:
        return "/clf-tarana/";

      case UrlPath.ambassadors:
        return "/ambassadors/";

      case UrlPath.resourcePersons:
        return "/portfolio/resource_persons_and_institutions_clf/";

      case UrlPath.childProdigies:
        return "/child-prodigies/";

      case UrlPath.partnerOrganization:
        return "/partner-organizations/";

      case UrlPath.corePartners:
        return "/core-partners/";

      case UrlPath.influencers:
        return "/influencers-and-storytellers/";

      case UrlPath.strands:
        return "/strands/";

      case UrlPath.incredibleLibraries:
        return "/incredible-libraries/";

      case UrlPath.digitalKutab:
        return "/digi-kutab-khanay/";

      case UrlPath.kitabGarri:
        return "/clf-kitab-gari/";

      case UrlPath.youngAuthorAward:
        return "/young-author-award-yaa/";

      case UrlPath.yAA2022Launch:
        return "/yaa-winners-2021-2022/";

      case UrlPath.yAA2021Winners:
        return "/yaa-winners-2020-2021/";

      case UrlPath.yAA1920Winners:
        return "/yaa-winners-2019-2020/";

      case UrlPath.yAA1920Members:
        return "/yaa-jury-members-2019-2020/";

      case UrlPath.yAAFaqs:
        return "/yaa-faqs/";

      case UrlPath.onlineBookClub:
        return "/online-book-club/";

      case UrlPath.languageTeaches:
        return "/every-language-teaches-us/";

      case UrlPath.storyBytes:
        return "/learning-flipped/";

      case UrlPath.artCraftTherapy:
        return "http://itacec.org/Art-Therapy-Interactive-Activities";

      case UrlPath.digitalLearningFestivals:
        return "";

      case UrlPath.plfPublications:
        return "/publications/";

      case UrlPath.plfUpComings:
        return "/upcoming-clf/";

      case UrlPath.plfWorkshops:
        return "/clf-workshops/";

      case UrlPath.campaigns:
        return "/campaigns/";

      case UrlPath.schoolReadingProgram:
        return "/school-reading-program-2016/";

      case UrlPath.plfActivities:
        return "/clf-activities/";

      // button urls

      case UrlPath.tarana:
        return "/#tarana";

      case UrlPath.poster:
        return "/#poster";

      case UrlPath.sponsors:
        return "/#sponsors";

      case UrlPath.program:
        return "/#program";

      case UrlPath.resourcePerson:
        return "/#Resource_Persons";

      case UrlPath.gallery:
        return "/#Gallery";

      case UrlPath.media:
        return "/#media";

      case UrlPath.getInvolved:
        return "/#getInvolved";

      case UrlPath.testimonials:
        return "/#testimonials";

      case UrlPath.venue:
        return "/#venue";

      case UrlPath.registration:
        return "/#registration";

      case UrlPath.videos:
        return "/#videos";

      case UrlPath.bookLaunches:
        return "/#book_laucnches";

      default:
        return "";
    }
  }
}

//
