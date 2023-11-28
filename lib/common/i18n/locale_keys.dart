import 'package:flutter/material.dart';

/// 多語言 keys
class LocaleKeys {
  // 通用
  static const commonBottomSave = 'common_bottom_save';
  static const commonBottomRemove = 'common_bottom_remove';
  static const commonBottomCancel = 'common_bottom_cancel';
  static const commonBottomConfirm = 'common_bottom_confirm';
  static const commonBottomApply = 'common_bottom_apply';
  static const commonBottomBack = 'common_bottom_back';
  static const commonSearchInput = 'common_search_input';
  static const commonSelectTips = 'common_select_tips';
  static const commonMessageSuccess = 'common_message_success';
  static const commonMessageIncorrect = 'common_message_incorrect';

  // 樣式
  static const stylesTitle = 'styles_title';

  // 歡迎頁
  static const welcomeOneTitle = 'welcome_one_title';
  static const welcomeOneDesc = 'welcome_one_desc';
  static const welcomeTwoTitle = 'welcome_two_title';
  static const welcomeTwoDesc = 'welcome_two_desc';
  static const welcomeThreeTitle = 'welcome_three_title';
  static const welcomeThreeDesc = 'welcome_three_desc';
  static const welcomeSkip = 'welcome_skip';
  static const welcomeNext = 'welcome_next';
  static const welcomeStart = 'welcome_start';

  // 登錄、註冊 - 通用
  static const loginForgotPassword = 'login_forgot_password';
  static const loginSignIn = 'login_sign_in';
  static const loginOrText = 'login_or_text';
  static const loginSignUp = 'login_sign_up';
  static const userName = 'user_name';
  static const emailAddress = 'email_address';
  static const password = 'password';
  static const passwordconfirm = 'password_confirm';
  static const dontHaveAccount = 'dont_have_account';
  static const alreadyHaveaccount = 'already_have_account';
  static const forgotPassword = 'forgot_password';

  // 找回密碼 - forgot password
  static const resetPasswordEmailSent = 'reset_password_email_sent';
  static const retrievePassword = 'retrieve_password';
  static const sentEmail = 'sent_email';

  // 註冊 - register user
  static const registerTitle = 'register_title';
  static const registerDesc = 'register_desc';
  static const loginTitle = 'login_title';
  static const loginDesc = 'login_desc';
  static const confirmPolicy = 'confirm_policy';
  static const registerFormName = 'register_form_name';
  static const registerFormEmail = 'register_form_email';
  static const registerFormPhoneNumber = 'register_form_phone_number';
  static const registerFormPassword = 'register_form_password';
  static const registerFormFirstName = 'register_form_first_name';
  static const registerFormLastName = 'register_form_last_name';
  static const registerHaveAccount = 'register_have_account';

  // 驗證提示
  static const validatorRequired = 'validator_required';
  static const validatorEmail = 'validator_email';
  static const validatorMin = 'validator_min';
  static const validatorMax = 'validator_max';
  static const validatorPassword = 'validator_password';
  static const validatorPasswordConfirm = 'validator_password_confirm';

  // home main page
  static const ghomeHelloUser = 'home_hello_user';
  static const ghomeHealthTitle = 'home_health_title';
  static const ghomeFitnessTrackerTitle = 'home_fitness_tracker_title';
  static const ghomeWellnessChatbotTitle = 'home_wellness_chatbot_title';
  static const ghomeWellnessScoreTitle = 'home_wellness_score_title';
  static const ghomeWellnessScoreDesc = 'home_wellness_score_desc';

  // home func card
  static const ghomeFuncCardHeartRate = 'home_func_card_heart_rate';
  static const ghomeFuncCardHeartRateNumber =
      'home_func_card_heart_rate_number';
  static const ghomeFuncCardHeartRateBPM = 'home_func_card_heart_rate_bpm';
  static const ghomeFuncCardBloodPressure = 'home_func_card_blood_pressure';
  static const ghomeFuncCardBloodPressureSystolic =
      'home_func_card_blood_pressure_systolic';
  static const ghomeFuncCardBloodPressureDiastolic =
      'home_func_card_blood_pressure_diastolic';
  static const ghomeFuncCardBloodPressureNumber =
      'home_func_card_blood_pressure_number';
  static const ghomeFuncCardBloodPressureMMHG =
      'home_func_card_blood_pressure_mmhg';
  static const ghomeFuncCardStep = 'home_func_card_step';
  static const ghomeFuncCardStepSteps = 'home_func_card_step_steps';
  static const ghomeFuncCardSleep = 'home_func_card_Sleep';
  static const ghomeFuncCardSleepNumber = 'home_func_card_Sleep_number';
  static const ghomeFuncCardSleepHours = 'home_func_card_Sleep_hours';

  // home fitness tracker
  static const ghomeFitnessCaloriesTitle = 'home_fitness_calories_title';
  static const ghomeFitnessStepsTaken = 'home_fitness_steps_taken';
  static const ghomeFitnessStepsTakenDesc = 'home_fitness_steps_taken_desc';
  static const ghomeFitnessNutrition = 'home_fitness_nutrition';
  static const ghomeFitnessSleep = 'home_fitness_sleep';
  static const ghomeFitnessSleepDesc = 'home_fitness_sleep_desc';

  // task page
  static const addTask = 'add_task';
  static const taskToday = 'task_today';
  static const addTaskTitle = 'add_task_title';
  static const addTaskNote = 'add_task_note';
  static const addTaskDate = 'add_task_date';
  static const addTaskStartTime = 'add_task_start_time';
  static const addTaskEndTime = 'add_task_end_time';
  static const addTaskRepeat = 'add_task_repeat';
  static const addTaskRemind = '';

  // setting my account
  static const settingMyAccountTitle = 'setting_my_account_title';
  static const settingGeneralTitle = 'setting_general_title';
  static const settingGeneralPersonalInfo = 'setting_general_personal_info';
  static const settingGeneralNotification = 'setting_general_notification';
  static const settingAccessibilityTitle = 'setting_accessibility_title';
  static const settingAccessibilityLanguage = 'setting_accessibility_language';
  static const settingAccessibilityDarkMode = 'setting_accessibility_dark_mode';

  // setting my account - personal information
  static const settingPersonalInfomationTitle =
      'setting_personal_infomation_title';
  static const settingPersonalInfomationUserName =
      'setting_personal_infomation_user_name';
  static const settingPersonalInfomationHeight =
      'setting_personal_infomation_height';
  static const settingPersonalInfomationWeight =
      'setting_personal_infomation_weight';
  static const settingPersonalInfomationDateOfBirth =
      'setting_personal_infomation_birth_date';

  // setting my account - sign out
  static const settingSignOutTitle = 'setting_sign_out_title';

  // wellness news page
  static const wellnessNewsTitle = 'wellness_news_title';

  // day package
}
