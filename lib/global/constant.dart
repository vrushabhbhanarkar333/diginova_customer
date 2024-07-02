// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

// String BASE_URL = 'https://diginova-back.onrender.com/api/v1/api-docs/';
String BASE_URL = 'http://localhost:8000/api/v1/';
// String BASE_URL = 'http://localhost:8000/api/v1/';
String IMAGE_BASE_URL = 'https://digi-iot.s3.ap-south-1.amazonaws.com/images/';
String LOGIN_URL = 'auth/login';
String PROJECT_CUSTOMER = 'project/customer';
String PROJECT = 'project';
String CUSTOMER_INFO = 'customer/my/info';
String CHATBOT = 'messages/chatbot';

String REGISTER_URL = '/api/v1/auth/register';

String BACKGROUNDIMAGE = 'assets/images/Background.png';
String PROJECTIMAGE = 'assets/icons/homeScreenIcons/tabler_files.png';
String FILESIMAGE = 'assets/icons/homeScreenIcons/prime_server (1).png';
String PERFORMANCEIMAGE = 'assets/icons/homeScreenIcons/ri_robot-2-line.png';
String UPDATEIMAGE = 'assets/icons/homeScreenIcons/fa_newspaper-o copy.png';
String MONITERIMAGE = 'assets/icons/homeScreenIcons/Frame 34233.png';
String RAISE_TICKETIMAGE =
    'assets/icons/homeScreenIcons/arcticons_verizon-messages (1).png';
String LOCATIONIMAGE = 'assets/icons/homeScreenIcons/mi_location.png';
String WARRENTYIMAGE = 'assets/icons/homeScreenIcons/tdesign_certificate-1.png';
String KNOWLEDGEBASEIMAGE = 'assets/icons/ri_question-answer-line (1).png';

const String APP_NAME = "Novasmart";
String AVATAR = 'assets/images/Avatar.png';

const double SIZE_XXS = 6.0;
const double SIZE_XS = 10.0;
const double SIZE_SM = 12.0;
const double SIZE_M = 17.0;

const double SIZE_S = 16.0;
const double SIZE_IC = 20.0;
const double SIZE_MD = 30.0;
const double SIZE_LG = 36.0;

const double BORDER_RADIUS_LG = 15.0;
const double BORDER_RADIUS_MD = 10.0;
const double BORDER_RADIUS_M = 12.0;
const double BORDER_RADIUS_XL = 20.0;

const double PADDING_SM = 16.0;
const double PADDING_XS = 10.0;
const double PADDING_MD = 20.0;
const double PADDING_LG = 32.0;
const double PADDING_XL = 48.0;
const double PADDING_XXS = 5.0;
const double PADDING_XXL = 100.0;

const double FONT_XS = 10.0;
const double FONT_XSS = 12.0;
const double FONT_14 = 14.0;
const double FONT_SM = 15.0;
const double FONT_16 = 16.0;
const double FONT_M = 18.0;
const double FONT_20 = 20.0;
const double FONT_MD = 24.0;
const double FONT_LG = 32.0;
const double FONT_40 = 40.0;
const double FONT_50 = 50.0;

const double SPACING_LG = 30.0;
const double SPACING_XS = 5.0;
const double SPACING_XL = 50.0;
const double SPACING_SM = 10.0;
const double SPACING_MD = 15.0;
const double SPACING_M = 20.0;
const double SPACING_XXS = 2.0;
// BLUE_SHADE_CLR
const Color ICON_CLR = Color(0XFF016dd6);

const Color DEFAULT_CLR = Color(0XFF4180D4);
const Color BLUE_SHADE_CLR = Color(0XFF4180D4);
const Color BLUE_BLUR_SHADE_CLR = Color(0XFF6B7897);
const Color BLUE__CLR = Color(0XFFADC0F8);
// const Color SELECTED_ICON_CLR = Color(0XFF006FFD);
const Color SELECTED_ICON_CLR = Color(0XFF4180D4);

const Color BLACK_CLR = Color(0XFF000000);
const Color BLACK_SHADE_CLR = Color(0XFF292D30);
const Color BLACK_CLR_SHADE = Color(0XFF1E1E1E);
const Color GREY_SHADE_CLR = Color(0XFFC8CDD1);
const Color GREY_BLUR_SHADE_CLR = Color(0XFF8F9098);
const Color GREY_CLR = Color(0XFF4F4F4F);
const Color WARM_GRAY_CLR = Color(0XFF71727A);
const Color GRAY_CLR_SHADE = Color(0XFF8D9092);
const Color GREY_SHADES_CLR = Color(0XFF4F4F4F);
const Color WHITE_CLR = Color(0XFFFAFAFA);
const Color WHITE_SHADE_CLR = Color(0XFFFFFFFF);
const Color TRANSPARENT_CLR = Color.fromARGB(0, 0, 0, 0);
const Color AVATAR_BG_CLR = Color(0XFF4180D4);
const Color CATEGORIES_BG_CLR = Color(0XFFFAFAFA);
const Color DIVIDER_CLR = Color(0XFFD9D9D9);
const Color BLACK_SHADE = Color(0XFF1F2024);
// const Color BLUE_DARK_CLR = Color(0XFF006FFD);
const Color BLUE_DARK_CLR = Color(0XFF4180D4);
const Color BTN_BLUE_CLR = Color(0XFF4180D4);

// const Color BTN_BLUE_CLR = Color(0XFF0C8CE9);
const Color BLUE_CLR_SHADE = Color(0XFFB4DBFF);
const Color GREEN_SHADE_CLR = Color(0XFF66CB9F);
const Color GREY_SHADE_CLRS = Color(0XFF9D9D9D);
const Color BLUR_GREY_SHADE_CLRS = Color(0XFFAEAEB3);
const Color GREY_BLUE_SHADE_CLRS = Color(0XFF667085);
const Color PURPLE_SHADE_CLR = Color(0XFF200E32);
const Color CIRCLE_PERCENTAGE_BG_CLR = Color(0XFF0C8CE9);
const Color LIGHT_BLUE_CLR = Color(0XFF34B3F1);
const Color PURPLE_CLR = Color(0XFF263257);
const Color PURPLE_NORMAL_SHADE_CLR = Color(0XFF8A96BC);
const Color GREY_COLOR = Color(0XFFB1B1B1);
const Color GREY_COLOR_SHADE = Color(0XFF999999);
const Color BLACK_N_SHADE = Color(0XFF494949);
const Color BLUE_N_SHADE_CLR = Color(0XFF4296E4);
const Color LIGHT_GREY_CLR = Color(0XFFE9E9F2);
const Color BG_GREY_SHADE_CLR = Color(0XFFF6F6F5);
const Color DARK_BLUE_CLR = Color(0XFF0C2638);
const Color TXT_FIELD_HINT_CLR = Color(0XFFB7BCCA);
const Color RED_SHADE_CLRS = Color.fromARGB(226, 228, 9, 9);

const Color TEXTFIELD_HINT_TXT_CLR = Color(0XFF8F9098);
const Color TEXTFIELD_BG_CLR = Color(0XFFF8F9FE);
const Color TEXTFIELD_BACKGROUND_CLR = Color(0XFFF5F5F5);
const Color TEXTFIELD_BORDER_CLR = Color(0XFFC5C6CC);

TextStyle NOVASMART_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_40,
  fontWeight: FontWeight.bold,
  color: DEFAULT_CLR,
);
TextStyle WELCOME_BACK_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_50,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR,
);

TextStyle CREATE_ACCOUNT_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_MD,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR,
);
TextStyle FONT_16_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_16,
  fontWeight: FontWeight.w500,
  color: BLACK_CLR,
);

TextStyle FONT_16_SEMI_BOLD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_16,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR_SHADE,
);

TextStyle FONT16_SEMI_BOLD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_16,
  fontWeight: FontWeight.w600,
  color: GREY_COLOR,
);
TextStyle FONT_MD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_MD,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR,
);
TextStyle FONT_14_BOLD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.bold,
  color: BLACK_CLR,
);

TextStyle FONT_14_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.w400,
  color: DEFAULT_CLR,
);
TextStyle FONT_14_REGULAR_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.w400,
  color: BLACK_CLR_SHADE,
);
TextStyle FONT_14_REGULAR_TEXTFILELD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.w400,
  color: TXT_FIELD_HINT_CLR,
);
TextStyle FONT_14_MEDIUM_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.w500,
  color: BLACK_SHADE,
);
TextStyle FONT_14_SEMI_BOLD_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_14,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR_SHADE,
);

TextStyle SIGNUP_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_SM,
  fontWeight: FontWeight.w400,
  color: GREY_CLR,
);

TextStyle TEXTFIELD_HINT_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_SM,
  fontWeight: FontWeight.w400,
  color: TEXTFIELD_HINT_TXT_CLR,
);

TextStyle TEXT_STYLE_MD = GoogleFonts.poppins(
  fontSize: FONT_MD,
  fontWeight: FontWeight.w600,
  color: DEFAULT_CLR,
);
TextStyle TEXT_STYLE_MD_EXTRA_BOLD = GoogleFonts.poppins(
  fontSize: FONT_MD,
  fontWeight: FontWeight.w800,
  color: WHITE_SHADE_CLR,
);

TextStyle TEXT_STYLE_SM = GoogleFonts.poppins(
  fontSize: FONT_SM,
  fontWeight: FontWeight.w400,
  color: BLACK_CLR,
);
TextStyle TEXT_STYLE_XS = GoogleFonts.poppins(
  fontSize: FONT_XS,
  fontWeight: FontWeight.w500,
);
TextStyle TEXT_STYLE = GoogleFonts.poppins();
TextStyle TEXT_STYLE_SM_BOLD = GoogleFonts.poppins(
  fontSize: FONT_SM,
  fontWeight: FontWeight.w700,
);
TextStyle TEXT_STYLE_SM_SEMI_BOLD = GoogleFonts.poppins(
  fontSize: FONT_SM,
  fontWeight: FontWeight.w600,
  color: BLACK_CLR_SHADE,
);

TextStyle TEXT_STYLE_M = GoogleFonts.poppins(
  fontSize: FONT_M,
  fontWeight: FontWeight.w500,
);
TextStyle TEXT_STYLE_M_SEMI_BOLD = GoogleFonts.poppins(
  fontSize: FONT_M,
  fontWeight: FontWeight.w600,
);
TextStyle TEXT_STYLE_M_BOLD = GoogleFonts.poppins(
  fontSize: FONT_M,
  fontWeight: FontWeight.w700,
);

TextStyle TEXT_STYLE_XSS = GoogleFonts.poppins(
  fontSize: FONT_XSS,
  fontWeight: FontWeight.w600,
  color: WHITE_CLR,
);
TextStyle TEXT_STYLE_XSS_NORMAL = GoogleFonts.poppins(
  fontSize: FONT_XSS,
);
TextStyle TEXT_STYLE_XSS_MEDIUM = GoogleFonts.poppins(
  fontSize: FONT_XSS,
  fontWeight: FontWeight.w400,
  color: BLACK_CLR,
);
TextStyle DROP_DOWN =
    GoogleFonts.poppins(color: Colors.black, fontSize: FONT_SM);

TextStyle TEXT_STYLE_XS_NORMAL = GoogleFonts.poppins(
  fontSize: FONT_XS,
);
TextStyle TEXT_STYLE_XS_BOLD = GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
  fontSize: FONT_XS,
);
TextStyle TEXT_STYLE_FONT_20_SEMI_BOLD = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: FONT_20,
  color: BLACK_CLR_SHADE,
);
TextStyle TEXT_STYLE_FONT_20_BOLD = GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
  fontSize: FONT_20,
  color: BLACK_N_SHADE,
);
TextStyle TEXT_STYLE_FONT_20_SEMI_BOLD_DEFAULT_CLR = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: FONT_20,
  color: DEFAULT_CLR,
);

TextStyle FONT_16_poppins_NORMAL_TXT_STYLE = GoogleFonts.poppins(
  fontSize: FONT_16,
  fontWeight: FontWeight.w400,
  color: BLACK_N_SHADE,
);

double mediaQueryW(BuildContext context) => MediaQuery.of(context).size.width;
double mediaQueryH(BuildContext context) => MediaQuery.of(context).size.height;

String createUniqueS3FilenameWithDate(String filename) {
  // Get current date
  String date = DateTime.now().toString().substring(0, 10).replaceAll('-', '');

  // Generate a UUID
  String uniqueId = Uuid().v4();

  // Get file extension
  String ext = filename.split('.').last;

  // Remove extension from filename
  String baseName = filename.replaceAll('.$ext', '');

  // Replace invalid characters with underscores
  String validBaseName = baseName.replaceAll(RegExp(r'[^a-zA-Z0-9-_]'), '_');

  // Construct unique filename
  String uniqueFilename = '$validBaseName-$date-$uniqueId.$ext';

  return uniqueFilename;
}
