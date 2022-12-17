String restaurantName = "Indigo Bar Nicosia";
String restaurantDesc =
    "Çıkmaz Sokak Partileri bünyesinde INDIGO Bar & Lounge sıcak atmosferi, birbirinden lezzetli kokteylleri ve eşsiz dokusuyla sizleri bekliyor... ";
String address = "Asmaaltı Sokak, No:38 Nicosia";
String open_time = "12:00";
String close_time = "01:55";

String indigoWebsite = "https://indigobarnicosia.com";
String webDomain = "https://dash.indigobarnicosia.com";
String webAppApiUrl = webDomain + '//wp-json/wc/v3';
String apiRestaurantMenuRoute = webDomain + "api/restaurant";

String wpMenuConsumer = 'ck_c69438b302764f73152385c4af0b698ae90f2c83';
String wpMenuSecret = 'cs_89acdf65a9092fa2689e2794c5e8600dacc51124';
String accessControl =
    '&consumer_key=' + wpMenuConsumer + '&consumer_secret=' + wpMenuSecret;

String webAppCategoriesApi =
    webAppApiUrl + '/products/categories?lang=tr' + accessControl;
String webAppProductsApi = webAppApiUrl + '/products?lang=tr' + accessControl;
String tempBannerBG = "assets/images/sefler-menu-home-bg2.jpg";
