import 'package:flutter/material.dart';

import '../locale_keys.dart';

/// 多語言 英文
Map<String, String> localeEn = {
  // 通用
  LocaleKeys.commonSearchInput: 'Enter keyword',
  LocaleKeys.commonBottomSave: 'Save',
  LocaleKeys.commonBottomRemove: 'Remove',
  LocaleKeys.commonBottomCancel: 'Cancel',
  LocaleKeys.commonBottomConfirm: 'Confirm',
  LocaleKeys.commonBottomApply: 'Apply',
  LocaleKeys.commonBottomBack: 'Back',
  LocaleKeys.commonSelectTips: 'Please select',
  LocaleKeys.commonMessageSuccess: '@method successfully',
  LocaleKeys.commonMessageIncorrect: '@method incorrect',

  // 樣式
  LocaleKeys.stylesTitle: 'Sytles && Function',

  // welcome 歡迎
  LocaleKeys.welcomeOneTitle: 'Personalize Your Health with Intelligent AI.',
  LocaleKeys.welcomeOneDesc:
      'Achieve your health goals with the help of our smart AI technology.',
  LocaleKeys.welcomeTwoTitle: 'Smart Fitness & Nutrition Tracker',
  LocaleKeys.welcomeTwoDesc:
      'Stay on top of your fitness and nutrition goals with our smart tracker.',
  LocaleKeys.welcomeThreeTitle:
      'Empathetic Health Healthcare AI Chatbot For All',
  LocaleKeys.welcomeThreeDesc:
      'Experience compassionate healthcare with our empathetic AI chatbot.',
  LocaleKeys.welcomeSkip: 'Skip',
  LocaleKeys.welcomeNext: 'Next',
  LocaleKeys.welcomeStart: 'Get Started',

  // 登錄、註冊 - 通用
  LocaleKeys.loginForgotPassword: 'Forgot Password?',
  LocaleKeys.loginSignIn: 'Sign In',
  LocaleKeys.loginSignUp: 'Sign Up',
  LocaleKeys.loginOrText: 'Or',
  LocaleKeys.userName: 'User Name',
  LocaleKeys.emailAddress: 'Email Address',
  LocaleKeys.password: 'Password',
  LocaleKeys.passwordconfirm: 'Password Confirmation',
  LocaleKeys.dontHaveAccount: 'Don\'t have an account?',
  LocaleKeys.alreadyHaveaccount: 'Already have an account?',
  LocaleKeys.forgotPassword: 'Forgot Password?',

  // 找回密碼 - forgot password
  LocaleKeys.resetPasswordEmailSent: 'Email has been sent',
  LocaleKeys.retrievePassword: 'Retrieve Password',
  LocaleKeys.sentEmail: 'Sent Email',

  // 註冊 - new user
  LocaleKeys.registerTitle: 'Sign Up',
  LocaleKeys.registerDesc: 'Sign up to continue',
  LocaleKeys.loginTitle: 'Sign In',
  LocaleKeys.loginDesc:
      'Sign in and get your health personalized with our AI Technology.',
  LocaleKeys.confirmPolicy:
      'By continuing you accept our Privacy Policy and Term of Use.',
  LocaleKeys.registerFormName: 'User Name',
  LocaleKeys.registerFormEmail: 'Email',
  LocaleKeys.registerFormPhoneNumber: 'Phone number',
  LocaleKeys.registerFormPassword: 'Password',
  LocaleKeys.registerFormFirstName: 'First name',
  LocaleKeys.registerFormLastName: 'Last name',
  LocaleKeys.registerHaveAccount: 'Already have an account?',

  // 驗證提示
  LocaleKeys.validatorRequired: 'The field is obligatory',
  LocaleKeys.validatorEmail: 'The field must be an email',
  LocaleKeys.validatorMin: 'Length cannot be less than @size',
  LocaleKeys.validatorMax: 'Length cannot be greater than @size',
  LocaleKeys.validatorPassword:
      'password must have between @min and @max digits',
  LocaleKeys.validatorPasswordConfirm: 'password must be the same',

  // home main page
  LocaleKeys.ghomeHelloUser: 'Hello, ',
  LocaleKeys.ghomeHealthTitle: 'Smart Health Metrics',
  LocaleKeys.ghomeFitnessTrackerTitle: 'Fitness Tracker',
  LocaleKeys.ghomeWellnessChatbotTitle: 'Wellness AI Chatbot',
  LocaleKeys.ghomeWellnessScoreTitle: 'Wellness Score',
  LocaleKeys.ghomeWellnessScoreDesc:
      'Based on your data, we think your health status is above average.',

  // home func card
  LocaleKeys.ghomeFuncCardHeartRate: 'Heart Rate',
  LocaleKeys.ghomeFuncCardHeartRateNumber: '65',
  LocaleKeys.ghomeFuncCardHeartRateBPM: 'BPM',
  LocaleKeys.ghomeFuncCardBloodPressure: 'Blood Pressure',
  LocaleKeys.ghomeFuncCardBloodPressureSystolic: 'Systolic Pressure',
  LocaleKeys.ghomeFuncCardBloodPressureDiastolic: 'Diastolic Pressure',
  LocaleKeys.ghomeFuncCardBloodPressureNumber: '120',
  LocaleKeys.ghomeFuncCardBloodPressureMMHG: 'mmHg',
  LocaleKeys.ghomeFuncCardStep: 'Step',
  LocaleKeys.ghomeFuncCardStepSteps: 'Steps',
  LocaleKeys.ghomeFuncCardSleep: 'Sleep',
  LocaleKeys.ghomeFuncCardSleepNumber: '8',
  LocaleKeys.ghomeFuncCardSleepHours: 'hours',

  // home fitness tracker
  LocaleKeys.ghomeFitnessCaloriesTitle: 'Calories Burned',
  LocaleKeys.ghomeFitnessStepsTaken: 'Steps Taken',
  LocaleKeys.ghomeFitnessStepsTakenDesc: 'You have taken @steps steps.',
  LocaleKeys.ghomeFitnessNutrition: 'Nutrition',
  LocaleKeys.ghomeFitnessSleep: 'Sleep',
  LocaleKeys.ghomeFitnessSleepDesc: 'You have slept @sleep hours.',

  // task page
  LocaleKeys.addTask: 'add Task',
  LocaleKeys.taskToday: 'Today',
  LocaleKeys.addTaskTitle: 'Add Task',
  LocaleKeys.addTaskDate: 'Date',
  LocaleKeys.addTaskNote: 'Note',
  LocaleKeys.addTaskStartTime: 'Start Time',
  LocaleKeys.addTaskEndTime: 'End Time',
  LocaleKeys.addTaskRemind: 'Remind',
  LocaleKeys.addTaskRepeat: 'Repeat',

  // setting my account
  LocaleKeys.settingMyAccountTitle: 'My Account',
  LocaleKeys.settingGeneralTitle: 'General Settings',
  LocaleKeys.settingGeneralPersonalInfo: 'Personal Info',
  LocaleKeys.settingGeneralNotification: 'Notification',
  LocaleKeys.settingAccessibilityTitle: 'Accessibility',
  LocaleKeys.settingAccessibilityLanguage: 'Language',
  LocaleKeys.settingAccessibilityDarkMode: 'Dark Mode',

  // setting my account - personal information
  LocaleKeys.settingPersonalInfomationTitle: 'Personal Information',
  LocaleKeys.settingPersonalInfomationUserName: 'User Name',
  LocaleKeys.settingPersonalInfomationHeight: 'Height',
  LocaleKeys.settingPersonalInfomationWeight: 'Weight',
  LocaleKeys.settingPersonalInfomationDateOfBirth: 'Date of Birth',

  // setting my account - sign out
  LocaleKeys.settingSignOutTitle: 'Sign Out',

  // wellness news page
  LocaleKeys.wellnessNewsTitle: 'Wellness News',
};
