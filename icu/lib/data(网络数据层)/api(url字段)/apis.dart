class ICUApi {
 
static const String ALLHOME = "home/home";

static const String SendPlayLogURL = "plays/add";

static const String Pozhuhaoindex = "mizhaix/index";


  static String getPath({String path: '', int page, String resType: 'json'}) {
    StringBuffer sb = new StringBuffer(path);
    if (page != null) {
      sb.write('/$page');
    }
    if (resType != null && resType.isNotEmpty) {
      sb.write('/$resType');
    }
    return sb.toString();
  }


  static String getparameterSplicing(String path, Map parame) {
    var par;
    parame.forEach((k , v) {
         par = k + '=' + v + "&";
    });
    path = path + '?' + par + 'device_id=123213232&' + 'base=0';
    print(par);
    return path;
  }

  static Map postparameterSpling(Map parame) {
    parame["device_id"] = '123213232';
    parame['base'] = '0';
    return parame;

  }

}
