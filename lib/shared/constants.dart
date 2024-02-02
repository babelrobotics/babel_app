import 'package:flutter/material.dart';
/*=========================================================
            Colors
=========================================================*/

const Color LIGHT_PRIMARY_BACKGROUND = Color(0xFFFFFFFF); 
const Color LIGHT_SECONDARY_BACKGROUND = Color(0xFFD9E6F3); 
const Color LIGHT_ACCENT = Color(0xFFFF6F00); 
const Color LIGHT_SECONDARY_ACCENT = Color(0xFFFFC107); 
const Color LIGHT_TEXT = Color(0xFF323232); 
const Color LIGHT_SECONDARY_TEXT = Color(0xFF6E6E6E); 
const Color LIGHT_BORDERS = Color(0xFFD0D3D4); 

const Color DARK_PRIMARY_BACKGROUND = Color(0xFF33373E); 
const Color DARK_SECONDARY_BACKGROUND = Color(0xFF0A1A2F); 
const Color DARK_ACCENT = Color(0xFFF7931E); 
const Color DARK_SECONDARY_ACCENT = Color(0xFFFFAA00); 
const Color DARK_TEXT = Color(0xFFE0E1DD); 
const Color DARK_SECONDARY_TEXT = Color(0xFF677882); 
const Color DARK_BORDERS = Color(0xFF2A2F38); 


/*=========================================================
            Profile
=========================================================*/

const SECTION_DETAILS = 'Details';
const EMAIL = 'Email';
const NAME = 'Name';
const SECTION_PREFERENCES = 'Preferences';
const THEME = 'Theme';
const PICTURE_BORDER = 'Picture Border';

const EMAIL_FS = 'email';
const NAME_FS = 'name';
const THEME_FS = 'theme';
const PICTURE_BORDER_FS = 'border';

const MAPPING_APP_FIELD_TO_FS_FIELD = {
  EMAIL: EMAIL_FS,
  NAME: NAME_FS,
  THEME: THEME_FS,
  PICTURE_BORDER: PICTURE_BORDER_FS
};