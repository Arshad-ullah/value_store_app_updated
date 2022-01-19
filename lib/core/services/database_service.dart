// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/rendering.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:ponansasa_patient_app/core/constants/api_endpoints.dart';
// import 'package:ponansasa_patient_app/core/models/article-tag.dart';
// import 'package:ponansasa_patient_app/core/models/checkout.dart';
// import 'package:ponansasa_patient_app/core/models/confirm_otp_body.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/consultation-review.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/consultation.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/conversation.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/message.dart';
// import 'package:ponansasa_patient_app/core/models/consultation/profile.dart';
// import 'package:ponansasa_patient_app/core/models/doctor-tag.dart';
// import 'package:ponansasa_patient_app/core/models/doctor.dart';
// import 'package:ponansasa_patient_app/core/models/otp_body.dart';
// import 'package:ponansasa_patient_app/core/models/prescription.dart';
// import 'package:ponansasa_patient_app/core/models/profile/HealthInfo.dart';
// import 'package:ponansasa_patient_app/core/models/response/add_cart_response.dart';
// import 'package:ponansasa_patient_app/core/models/response/add_dependant_response.dart';
// import 'package:ponansasa_patient_app/core/models/response/create_consultation_response.dart';
// import 'package:ponansasa_patient_app/core/models/response/file_upload_response.dart';
// import 'package:ponansasa_patient_app/core/models/profile-body.dart';
// import 'package:ponansasa_patient_app/core/models/response/otp_response.dart';
// import 'package:ponansasa_patient_app/core/models/tags.dart';
// import 'package:ponansasa_patient_app/core/models/cart.dart';
// import 'package:ponansasa_patient_app/core/models/article.dart';
// import 'package:ponansasa_patient_app/core/models/refresh_token_body.dart';
// import 'package:ponansasa_patient_app/core/models/response/base_response.dart';
// import 'package:ponansasa_patient_app/core/models/medicine-tag.dart';
// import 'package:ponansasa_patient_app/core/models/pharmacy.dart';
// import 'package:ponansasa_patient_app/core/models/medicine.dart';
// import 'package:ponansasa_patient_app/core/models/user-dependants.dart';
// import 'package:ponansasa_patient_app/core/user_vitals.dart';
// import 'package:ponansasa_patient_app/ui/screens/others/help/faq/models/faq.dart';
// import 'package:ponansasa_patient_app/core/models/pharmacy-reviews.dart';

// import '../../locator.dart';
// import 'api_services.dart';
// import 'auth_data_service.dart';

// class DatabaseService {
// //  Dio dio = ApiServices().launch();
//   final firebaseDbRef = FirebaseDatabase.instance.reference().child('ponasasa');

//   ///
//   /// This function will get Medicine tag list from database
//   ///
//   getMedicineTagList() async {
//     Dio dio = ApiServices().launch();
//     print('@getMedicineTagList');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.medicineTag}");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<MedicineTag> medicineTags = [];
//       response.data['data'].forEach((e) {
//         medicineTags.add(MedicineTag.fromJson(e));
//       });
//       if (_resp.success) {
//         return medicineTags;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getMedicineTagList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get pharmacy list from database
//   ///

//   getPharmacyList(Position cordinates) async {
//     Dio dio = ApiServices().launch();
//     print('@getPharmacyList');
//     try {
//       //get response
//       final Response response = await dio.get(
//           "${EndPoint.baseUrl}${EndPoint.getpharmacies}",
//           queryParameters: {
//             "latitude": cordinates.latitude.toString(),
//             "longitude": cordinates.longitude.toString()
//           });
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Pharmacy> pharmacyList = [];
//       print("Response====> $response");
//       response.data['data'].forEach((e) {
//         pharmacyList.add(Pharmacy.fromJson(e));
//       });
//       if (_resp.success) {
//         return pharmacyList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getPharmacyListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get article list from database
//   ///
//   getArticles() async {
//     Dio dio = ApiServices().launch();
//     print('@getArticleList');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getArticles}");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Article> articleList = [];
//       response.data['data'].forEach((e) {
//         articleList.add(Article.fromJson(e));
//       });
//       if (_resp.success) {
//         return articleList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getArticleListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get all articletags list from database
//   ///
//   getArticleTags() async {
//     Dio dio = ApiServices().launch();
//     print('@getArticleTagsList');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getArticleTags}");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<ArticleTag> articleTagList = [];
//       response.data['data'].forEach((e) {
//         articleTagList.add(ArticleTag.fromJson(e));
//       });
//       if (_resp.success) {
//         return articleTagList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getArticleTagListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get all articles by tags list from database
//   ///
//   getArticleByTags(String tagId) async {
//     Dio dio = ApiServices().launch();
//     print('@getArticleByTagsList');
//     try {
//       //get response
//       final Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getArticleByTags}$tagId");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Article> articleByTagList = [];
//       response.data['data'].forEach((e) {
//         articleByTagList.add(Article.fromJson(e));
//       });
//       if (_resp.success) {
//         return articleByTagList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getArticleByTagListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get article list from database
//   ///
//   getNextPageArticles(pageNumber) async {
//     Dio dio = ApiServices().launch();
//     print('@getNextPageArticleList');
//     try {
//       //get response
//       final Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getArticles}?page=$pageNumber");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Article> articleList = [];
//       response.data['data'].forEach((e) {
//         articleList.add(Article.fromJson(e));
//       });
//       if (_resp.success) {
//         return articleList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getNextPageArticleListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   ///update views of particular article using article id
//   ///
//   updateArticleViews(String articleId) async {
//     Dio dio = ApiServices().launch();
//     print('@updateArticle Views ===> Article Id => $articleId}');
//     var response;
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.updateArticleView}",
//           data: {"article_id": "$articleId"});
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print('Exception @UpdateArticleViews: $e');
//       throw e.toString();
//     }
//   }

//   ///
//   ///update like of particular article using article id
//   ///
//   updateArticleLikes(String articleId) async {
//     Dio dio = ApiServices().launch();
//     print('@updateArticle likes ===> Article Id => $articleId}');
//     var response;
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.updateArticleLikes}",
//           data: {"article_id": "$articleId"});
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print('Exception @updateArticleLikes: $e');
//       throw e.toString();
//     }
//   }

//   ///
//   ///Get pharmacy reviews By pharmacy Ids from database
//   ///
//   getPharmacyReviews(pharmacyId) async {
//     print(pharmacyId);
//     Dio dio = ApiServices().launch();
//     print('@getPharmacyReviewList');
//     try {
//       //get response
//       final Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getPharReviews}$pharmacyId");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<PharmacyReview> pharmacyReviews = [];
//       //Handling the null exception in case of null repose.data
//       if (await response.data['data'] != null) {
//         await response.data['data'].forEach((e) {
//           pharmacyReviews.add(PharmacyReview.fromJson(e));
//         });
//       }
//       if (_resp.success) {
//         return pharmacyReviews;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getPharmacyReviewList: =>$e');
//       return null;
//     }
//   }

//   ///
//   ///Add pharmacy reviews to database
//   ///
//   addPharmacyReview(PharmacyReview pharmacyReview) async {
//     Dio dio = ApiServices().launch();
//     print('@addArticle: ${pharmacyReview.toJson()}');
//     var response;
//     try {
//       response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.addPharmacyReview}",
//           data: pharmacyReview.toJson());
//       print('Response: $response');
//       if (response.statusCode == 200) {
//         return response.data['data']['id'];
//       }
//       // return response.data['data']['id'];
//     } catch (e) {
//       print('Exception @AddPharmacyReview: $e');
//       throw e.toString();
//     }
//   }

//   ///
//   ///Ged medicines by tag from database
//   ///

//   getMedicinesByTag(String tagId) async {
//     Dio dio = ApiServices().launch();
//     print('@getMedicineList');
//     try {
//       //get response
//       final Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getMedicineByTag}$tagId");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Medicine> medicineList = [];
//       response.data['data'].forEach((e) {
//         medicineList.add(Medicine.fromJson(e));
//       });
//       print("@MedicineByTagIdListLength/${medicineList.length}");
//       if (_resp.success) {
//         return medicineList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getMedicineListList: =>$e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get FAQs from database
//   ///
//   getFaqsList(tagId) async {
//     print("@tagId=> $tagId");
//     Dio dio = ApiServices().launch();
//     print('@getFAQList');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getFaqs}$tagId");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Faq> faqList = [];
//       response.data['data'].forEach((e) {
//         faqList.add(Faq.fromJson(e));
//       });
//       if (_resp.success) {
//         return faqList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getFAQList: $e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get TAGs from database
//   ///

//   getTagList() async {
//     Dio dio = ApiServices().launch();
//     print('@getTagList');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getTags}");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<Tag> tagList = [];
//       response.data['data'].forEach((e) {
//         tagList.add(Tag.fromJson(e));
//       });
//       if (_resp.success) {
//         return tagList;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getTagList: $e');
//       return null;
//     }
//   }

//   ///
//   /// This function will get Doctor taglist from database
//   ///
//   getDoctorTagList() async {
//     Dio dio = ApiServices().launch(); // ApiServices().launch();
//     print('@getDoctorTagList');
//     try {
//       Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.docSpecialization}");
//       print('${response.statusCode}');
//       print('${response.data.toString()}');
//       final List<DoctorTag> doctorTags = [];
//       response.data['data'].forEach((e) {
//         doctorTags.add(DoctorTag.fromJson(e));
//         print("DoctorTags=> $e");
//       });
//       return doctorTags;
//     } catch (e, s) {
//       print('Exception @DatabaseService/getDoctorTagList: =>$e');
//       print(s);
//       return [];
//     }
//   }

//   ///
//   /// This function will get Doctor By Tag Id  from database
//   ///
//   getDoctorsByTagList(tagId) async {
//     Dio dio = ApiServices().launch(); // ApiServices().launch();
//     print('@getDoctorsByTagList');
//     try {
//       //get response
//       Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.doctorsBySpecialization}$tagId");
// //      print('${response.statusCode}');
// //      print('${response.data.toString()}');
//       final List<Doctor> doctors = [];
//       response.data['data'].forEach((e) {
//         doctors.add(Doctor.fromJson(e));
//         print("DoctorByTagID=> $e");
//       });
//       return doctors;
//     } catch (e, s) {
//       print('Exception @DatabaseService/getDoctorByTagList: =>$e');
//       print(s);
//       return [];
//     }
//   }

//   ///
//   /// This function will get Doctor By Id  from database
//   ///
//   getDoctorById(doctorId) async {
//     print("DOCTOR ID CHECKING FOR NULL $doctorId");
//     Dio dio = ApiServices().launch(); // ApiServices().launch();
//     print('@getDoctorByID');
//     try {
//       //get response
//       Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.doctorById}$doctorId");
//       print('${response.statusCode}');
//       print('${response.data.toString()}');
//       BaseResponse baseResponse =
//           BaseResponse.fromJson(response.data['data'][0]);
//       print(baseResponse.toJson());
//       Doctor doctor = Doctor();
//       doctor = Doctor.fromJson(response.data['data'][0]);
//       return doctor;
//     } catch (e, s) {
//       print('Exception @DatabaseService/getDoctorByDoctorId: =>$e');
//       print(s);
//     }
//   }

//   ///
//   ///This function will get the stream of all online doctors from the database
//   ///
//   getDoctorByTagStream(tagId) {
//     print("GetDocotorsStream=> doctorTagName=> $tagId");
//     Stream stream;
//     stream = FirebaseFirestore.instance
//         .collection('doctors')
//         .where('specialization_id', isEqualTo: tagId)
//         .where('isOnline', isEqualTo: true)
//         .snapshots();

//     return stream;
//   }

//   Future<OtpResponse> reqOtp(OtpBody body) async {
//     print('Phone number = ${body.phone_number}');
//     Dio dio = ApiServices().launch();
//     try {
//       final response = await dio.post("${EndPoint.baseUrl}${EndPoint.api_otp}",
//           data: body.toJson());
//       print('@reqOtp: OtpResponse: $response');
//       return OtpResponse.fromJson(response.data);
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<OtpResponse> reqConfirmOtp(ConfirmOtpBody body) async {
//     Dio dio = ApiServices().launch();
//     try {
//       final response = await dio.post("${EndPoint.baseUrl}${EndPoint.api_otp}",
//           data: body.toJson());
//       return OtpResponse.fromJson(response.data);
//     } catch (e) {
//       return e;
//     }
//   }

//   ///
//   /// This function will get PharmacyProducts/Medicines By Tag Id  from database
//   ///

//   getPharmacyProducts(pharId) async {
//     Dio dio = ApiServices().launch();
//     print('@getPharmacyProductsById');
//     try {
//       //get response
//       Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getPharProductsById}$pharId");
//       print('${response.statusCode}');
//       BaseResponse baseResponse = new BaseResponse.fromJson(response.data);
//       final List<Medicine> pharmacyProducts = [];
//       response.data['data'].forEach((e) {
//         print("pharmacyProductsById=> $e");
//         pharmacyProducts.add(Medicine.fromJson2(e));
//         print("pharmacyProductsById=> $e");
//         print("pharmacyProductsLength=> ${pharmacyProducts.length}");
//       });
//       if (baseResponse.success) {
//         return pharmacyProducts;
//       } else {
//         return baseResponse;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getPharmacyProductsByID: =>$e');
//       return null;
//     }
//   }

//   uploadImage(imgUrl) async {
//     Dio dio = ApiServices().launch();
//     Dio _dio = dio;
//     FormData formData = FormData.fromMap({
//       "image": MultipartFile.fromFile(imgUrl),
//     });
//     final response = await _dio.post("${EndPoint.baseUrl}${EndPoint.addImage}",
//         data: formData);
//     print('@uploadImage, Response: ${response.data}');
//   }

//   ///
//   ///This function will get profile single object form the database
//   ///
//   getProfileBody() async {
//     Dio dio = ApiServices().launch();
//     print('@getSingleProfileBody');
//     try {
//       /// Get Basic profile data
//       Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getProfileBody}");
//       print('UserProfileData: ${response.data}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       ProfileBody profileBody = ProfileBody.fromJson(response.data['data']);
//       profileBody.userVitals =
//           UserVitals.fromJson(response.data['data']['user_vitals']);
//       print(response);
//       if (_resp.success) {
//         return profileBody;
//       } else {
//         return _resp;
//       }
//     } catch (e, s) {
//       print('Exception @DatabaseService/getSingleProfileBody: =>$e');
//       print('$s');
//       return null;
//     }
//   }

//   getUserVitals() async {
//     Dio dio = ApiServices().launch();
//     print('@getUserVitals');
//     try {
//       /// Get user vitals
//       Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.userVitals}");
//       print('UserProfileData: ${response.data}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       var userVitals = UserVitals();
//       if (response.data['data'].length > 0)
//         userVitals = UserVitals.fromJson(response.data['data']);

//       return userVitals;
//     } catch (e, s) {
//       print('Exception @DatabaseService/getUserVitals: =>$e');
//       print('$s');
//     }
//   }

//   ///
//   ///This function will get profile single object form the database
//   ///
//   getSingleDependantBody(id) async {
//     Dio dio = ApiServices().launch();
//     print('@getSingleDependantProfileById');
//     try {
//       //get response for getting a single dependants from the database
//       Response response = await dio
//           .get("${EndPoint.baseUrl}${EndPoint.getSingleDependantProfile}$id/");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       UserDependants userDependant = UserDependants();
//       userDependant = UserDependants.fromJson2(response.data['data']);
//       print("Get UserDependants by id===> ${userDependant.toJson()}");
//       //if the response is success return the user dependant sother wise return the response to trace the issue
//       if (_resp.success) {
//         return userDependant;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getDependentProfileById: =>$e');
//       return null;
//     }
//   }

//   ///
//   ///This function will update the profile body object by doing put request
//   ///
//   updateProfileBody(ProfileBody profileBody, File selectedImageFile) async {
//     Dio dio = ApiServices().launch2();
//     print('@updateProfileBody');
//     try {
//       Map<String, dynamic> data = profileBody.toJson2();

//       if (selectedImageFile != null) {
//         data['avatar'] = await MultipartFile.fromFile(profileBody.avatar);
//       }
//       FormData formData = FormData.fromMap(data);

//       Response response = await dio.put(
//           "${EndPoint.baseUrl}${EndPoint.updateProfileBody}",
//           data: formData);
//       print('${response.statusCode}');
//       print('${response.data.toString()}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       return _resp;
//     } catch (e) {
//       print('Exception @DatabaseService/updateProfileBody: =>$e');
//       return null;
//     }
//   }

//   updateUserVitals(UserVitals userVitals) async {
//     Dio dio = ApiServices().launch();
//     print('@updateUserVitals');
//     try {
//       Response response = await dio.put(
//           "${EndPoint.baseUrl}${EndPoint.updateUserVitals}",
//           data: userVitals.toJson2());
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       return _resp;
//     } catch (e) {
//       print('Exception @DatabaseService/updateUserVitals: =>$e');
//       return null;
//     }
//   }

//   ///
//   ///This function will update the dependant profile body in the backend
//   ///
//   updateDependantProfileBody(
//       UserDependants userDependant, File selectedImageFile) async {
//     Dio dio = ApiServices().launch2();
//     // dio.options.contentType = 'application/json';
//     Map<String, dynamic> data;
//     FormData formData;
//     print('@updateDependantProfileBody===> ${userDependant.toJson()}');
//     try {
//       if (selectedImageFile != null) {
//         data = userDependant.toJson();
//         data['avatar'] = await MultipartFile.fromFile(userDependant.avatar);
//         formData = FormData.fromMap(data);
//       } else {
//         formData = FormData.fromMap(userDependant.toJson());
//       }
//       //get responseapplication
//       Response response = await dio.put(
//           "${EndPoint.baseUrl}${EndPoint.updateDependantProfile}${userDependant.id}/",
//           data: formData);
//       print('${response.statusCode}');
//       print('${response.data.toString()}');

//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       return _resp;
//     } catch (e) {
//       print('Exception @DatabaseService/updateDependantProfileBody: =>$e');
//       return null;
//     }
//   }

//   //this function will update health info in backend
//   updateHealthInfo(key, file) async {
//     Dio dio = ApiServices().launch2();
//     print('@UPDATEHealthInfo\n Key==> $key \n file==> ${file.path}');
//     try {
//       Map<String, dynamic> data = Map<String, dynamic>();
//       data[key] = await MultipartFile.fromFile(file.path.toString());

//       var formData = FormData.fromMap(data);

//       Response response = await dio.put(
//           "${EndPoint.baseUrl}${EndPoint.updateHealthInfo}",
//           data: formData);
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       return _resp;
//     } catch (e) {
//       print('Exception @DatabaseService/UpdateHealthInfo: =>$e');
//       throw e;
//     }
//   }

//   decideHealthInfo(HealthInfo updatedInfo) async {
//     Map<String, dynamic> data = updatedInfo.toJson();
//     if (updatedInfo.status == 'health_insurance') {
//       data['health_insurance'] = await MultipartFile.fromFile(
//           updatedInfo.healthInsurance.image.toString());
//     } else if (updatedInfo.status == 'national_id') {
//       data['national_id'] =
//           await MultipartFile.fromFile(updatedInfo.nationalId.image.toString());
//     } else if (updatedInfo.status == 'passport') {
//       data['pass_port'] =
//           await MultipartFile.fromFile(updatedInfo.passPort.image.toString());
//     } else if (updatedInfo.status == 'birth_certificate') {
//       data['birth_certificate'] = await MultipartFile.fromFile(
//           updatedInfo.birthCertificate.image.toString());
//     } else if (updatedInfo.status == 'vaccination_card') {
//       data['vaccination_card'] = await MultipartFile.fromFile(
//           updatedInfo.vaccinationCard.image.toString());
//     }
//     return data;
//   }

//   //
//   ///This function will add the dependant body object by doing Post request
//   ///
//   addDependant(UserDependants userDependants) async {
//     Dio dio = ApiServices().launch2();
//     print('@addDependantBody===> ${userDependants.toJson()}');
//     AddDependantResponse baseResponse = AddDependantResponse();
//     try {
//       Map<String, dynamic> data = userDependants.toJson();
//       data['avatar'] = await MultipartFile.fromFile(userDependants.avatar);

//       FormData formData = FormData.fromMap(data);
//       Response response = await dio.post(
//         "${EndPoint.baseUrl}${EndPoint.addDependant}",
//         data: formData,
//       );
//       print('Response: $response');
//       baseResponse = AddDependantResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print('Exception @addDependantBody: $e');
//     }
//   }

//   uploadFile(file) async {
//     Dio dio = ApiServices().launch();
//     print('@uploadFile');
//     FileUploadResponse fileUploadResponse = FileUploadResponse();
//     try {
//       Dio _dio = dio;
//       FormData formData = FormData.fromMap({
//         "image": await MultipartFile.fromFile(file.path),
//       });
//       final response = await _dio
//           .post("${EndPoint.baseUrl}${EndPoint.addImage}", data: formData);
//       print('@uploadImage, Response: ${response.data}');
//       fileUploadResponse = FileUploadResponse.fromJson(response.data);
//       return fileUploadResponse;
//     } catch (e) {
//       print('Exception @UploadImage: $e');
//       fileUploadResponse.success = false;
//       fileUploadResponse.addError(e.toString());
//       return fileUploadResponse;
//     }
//   }

// //
//   getUserData(id) {
// //    try {
// //      firebaseDbRef.child('conversations').push().set(conversation.toJson());
// //    } catch (e) {
// //      print('Exception @getConversationsStream: $e');
// //    }
//   }

// //
//   getAllConversations() {
//     try {
//       firebaseDbRef.child('conversations').onChildAdded.listen((Event event) {
//         print(event.snapshot.value.toString());
//       });
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

// //
//   getConversationsStream(id) {
//     Stream stream;
//     try {
//       stream = firebaseDbRef
//           .child('conversations')
//           .orderByChild('doctorId')
//           .equalTo(id)
//           .onChildAdded;
//       return stream;
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

//   getMessagesStream(Conversation conversation) {
//     print('@getMessagesStream with Conversation: ${conversation.toJson()}');
//     Stream stream;
//     try {
//       stream = firebaseDbRef
//           .child('chatMessages')
//           .child('${conversation.doctorId}_${conversation.patientId}')
//           .limitToLast(15)
//           .onChildAdded;
//       return stream;
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

//   sendMessage({Message message, Conversation conversation}) {
//     print('@createConversation');
//     try {
//       firebaseDbRef
//           .child('chatMessages')
//           .child('${conversation.doctorId}_${conversation.patientId}')
//           .push()
//           .set(message.toJson());
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

//   updateConversation(Conversation conversation) {
//     print('@updateConversation');
//     try {
//       firebaseDbRef
//           .child('conversations')
//           .child('${conversation.doctorId}_${conversation.patientId}')
//           .update(conversation.toJson());
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

//   createConversation(Conversation conversation) {
//     print('@createConversation');
//     try {
//       firebaseDbRef
//           .child('conversations')
//           .child('${conversation.doctorId}_${conversation.patientId}')
//           .set(conversation.toJson());
//     } catch (e) {
//       print('Exception @getConversationsStream: $e');
//     }
//   }

//   ///
//   /// This function will get Cart items from database
//   ///
//   getCartItems() async {
//     Dio dio = ApiServices().launch();
//     print('@getCartItems');
//     try {
//       //get response
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.getCartItems}");
//       print('${response.statusCode}');
//       BaseResponse _resp = BaseResponse.fromJson(response.data);
//       final List<CartItem> cartItems = [];
//       print("Responsekhan\n$response");
//       response.data['data'].forEach((e) {
//         cartItems.add(CartItem.fromJson(e));
//       });
//       if (_resp.success) {
//         return cartItems;
//       } else {
//         return _resp;
//       }
//     } catch (e) {
//       print('Exception @DatabaseService/getCartItems: =>$e');
//       return null;
//     }
//   }

// //
//   ///This function will add the cartItems to Cart
//   ///
//   addToCart(CartItem cartItem) async {
//     Dio dio = ApiServices().launch();
//     var baseResponse = AddCartResponse();
//     print('@addItemsToCart');
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.addCartItems}",
//           data: cartItem.toJson2());
//       print('Response: $response');
//       baseResponse = AddCartResponse.fromJson(response.data);
//       if (baseResponse.success) {
//         return baseResponse;
//       }
//       return response;
//     } catch (e) {
//       print('Exception @addItemsToCart: $e');
//       throw e.cast<String>();
//     }
//   }

//   ////
//   ///This function will delete cart from database
//   ///
//   deleteCartItem(cartItemId) async {
//     Dio dio = ApiServices().launch();
//     var baseResponse = BaseResponse();
//     print('@DeleteCartItemById');
//     try {
//       final response = await dio.delete(
//         "${EndPoint.baseUrl}${EndPoint.deleteCartItem}$cartItemId/",
//       );
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       if (baseResponse.success) {
//         return baseResponse;
//       }
//       return response;
//     } catch (e) {
//       print('Exception @DeleteCartItemById: $e');
//       throw e.cast<String>();
//     }
//   }

//   ///
//   ///This function will checkout the cart from custom backend
//   ///
//   checkoutCart(Checkout checkout) async {
//     print('@checkoutCart');
//     Dio dio = ApiServices().launch();
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.checkoutCart}",
//           data: checkout.toJson());

//       baseResponse = BaseResponse.fromJson(response.data);
//       print('Response: $response');

//       return baseResponse;
//     } catch (e) {
//       print('Exception @checkoutCart: $e');
//       throw e.toString();
//     }
//   }

//   ///
//   /// This function will get Cart items from database
//   ///
//   getHealthInfo() async {
//     Dio dio = ApiServices().launch();
//     print('@getHealthInfo');
//     try {
//       final Response response =
//           await dio.get("${EndPoint.baseUrl}${EndPoint.healthInfo}");
//       return HealthInfo.fromJson(response.data['data']?.first);
//     } catch (e) {
//       print('Exception @DatabaseService/getHealthInfo: =>$e');
//       return null;
//     }
//   }

//   ///
//   ///This function will send docotid and patient id for call purpose
//   ///
//   startConsultation(Consultation consultation) async {
//     print('@startConsultation  Firebase/CustomBackend');
//     try {
//       await firebaseDbRef
//           .child('consultation')
//           .child(consultation.id)
//           .set(consultation.toJson());
//     } catch (e) {
//       print('Exception @startCall: $e');
//     }
//   }

//   ///
//   ///This function will send docotid and patient id for call purpose
//   ///
//   createConsultation(Consultation consultation) async {
//     print('@createConsultation/CustomBackend');
//     Dio dio = ApiServices().launch();
//     CreateConsultationResponse baseResponse = CreateConsultationResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.createConsultation}",
//           data: consultation.toCustomBackendJson());
//       baseResponse = CreateConsultationResponse.fromJson(response.data);
//       print('Response: $response');
//       if (baseResponse.success || baseResponse.consultationId != null) {
//         return baseResponse;
//       } else {
//         baseResponse.consultationId = "consultationId";
//         return baseResponse;
//       }
//     } catch (e) {
//       print('Exception @createConsultation customBackend==>: $e');
//     }
//   }

//   ///
//   ///This function will update call status
//   ///
//   updateCallStatus(Consultation consultation) async {
//     print('@UpdateCallStatus');
//     try {
//       await firebaseDbRef
//           .child('consultation')
//           .child(consultation.id)
//           .update((consultation.toUpdatedJson()));
//     } catch (e) {
//       print('Exception @UpdateCallStatus: $e');
//     }
//   }

//   ///get Consultation streams from firebase database
//   ///
//   getConsultationStream(String patientId) async {
//     Stream stream;
//     try {
//       stream = firebaseDbRef
//           .child('consultation')
//           .orderByChild('patient_id')
//           .equalTo(patientId)
//           .onValue;
//       return stream;
//     } catch (e) {
//       print('Exception @getConsultationsStream: $e');
//     }
//   }

// //  ///
// //  /// This function will get articles from database
// //  ///
// //  getUserArticleList() async {
// //    Dio dio = ApiServices().launch();
// //    print('@getUserArticleList');
// //    try {
// //      //get response
// //      final Response response =
// //          await dio.get("${EndPoint.baseUrl}${EndPoint.userArticleList}");
// //      print('${response.statusCode}');
// //      BaseResponse _resp = BaseResponse.fromJson(response.data);
// //      final List<Article> userArticleList = [];
// //      response.data['data'].forEach((e) {
// //        userArticleList.add(Article.fromJson(e));
// //      });
// //      return userArticleList;
// //    } catch (e) {
// //      print('Exception @DatabaseService/userArticleList: $e');
// //      return null;
// //    }
// //  }
// //
// //  ///
// //  /// This function will create articles in database
// //  ///
// //  Future<String> createArticle(Article article) async {
// //    Dio dio = ApiServices().launch();
// //    print('@createArticle Article: ${article.toJson()}');
// //    var response;
// //    try {
// //      FormData formData = FormData.fromMap({
// //        "title": article.title,
// //        "content": article.content,
// //        "feature_image": await MultipartFile.fromFile(article.featureImage),
// //      });
// //      response = await dio.post("${EndPoint.baseUrl}${EndPoint.createArticle}",
// //          data: formData);
// //      print('Response: $response');
// //      if (response.statusCode == 200) {
// //        return response.data['data']['id'];
// //      }
// //      // return response.data['data']['id'];
// //    } catch (e) {
// //      print('Exception @createArticle: $e');
// //      throw RequestFailedException(e.toString());
// //    }
// //  }
// //
// //  getTermsAndPrivacy() async {
// //    Dio dio = ApiServices().launch();
// //    print('@getPrivacyPolicy}');
// //    var response;
// //    try {
// //      response =
// //          await dio.get("${EndPoint.baseUrl}${EndPoint.getPrivacyPolicy}");
// //      print('Response: $response');
// //      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
// //      if (baseResponse.success)
// //        return TermsAndPrivacy.fromJson(response.data['data']?.first);
// //      else
// //        return null;
// //    } catch (e) {
// //      print('Exception @createRx: $e');
// //      throw RequestFailedException(e.toString());
// //    }
// //  }
// //
// //  getReviews(id) async {
// //    Dio dio = ApiServices().launch();
// //    ReviewsResponse reviewsResponse;
// //    print('@getReviews');
// //    var response;
// //    try {
// //      response = await dio.get("${EndPoint.baseUrl}${EndPoint.getReviews}$id");
// //      print('Response: $response');
// //      reviewsResponse = ReviewsResponse.fromJson(response.data);
// //      return reviewsResponse;
// //    } catch (e, s) {
// //      print('Exception @getReviews: $e');
// //      print('Exception @getReviews: $s');
// //      reviewsResponse.success = false;
// //      reviewsResponse.addError(e.toString());
// //      return ReviewsResponse;
// ////      throw RequestFailedException(e.toString());
// //    }
// //  }
// //
// //  ///
// //  /// This function will get TAGs from database
// //  ///
// //
// //  getTagList() async {
// //    Dio dio = ApiServices().launch();
// //    print('@getTagList');
// //    try {
// //      //get response
// //      final Response response =
// //          await dio.get("${EndPoint.baseUrl}${EndPoint.getTags}");
// //      print('${response.statusCode}');
// //      BaseResponse _resp = BaseResponse.fromJson(response.data);
// //      final List<Tag> tagList = [];
// //      response.data['data'].forEach((e) {
// //        tagList.add(Tag.fromJson(e));
// //      });
// //      return tagList;
// //    } catch (e) {
// //      print('Exception @DatabaseService/getTagList: $e');
// //      return null;
// //    }
// //  }
// //
// //  ///
// //  /// This function will get FAQs from database
// //  ///
// //  getFaqsList(tagId) async {
// //    print("@tagId=> $tagId");
// //    Dio dio = ApiServices().launch();
// //    print('@getFAQList');
// //    try {
// //      //get response
// //      final Response response =
// //          await dio.get("${EndPoint.baseUrl}${EndPoint.getFaqs}$tagId");
// //      print('${response.statusCode}');
// //      BaseResponse _resp = BaseResponse.fromJson(response.data);
// //      final List<Faq> faqList = [];
// //      response.data['data'].forEach((e) {
// //        faqList.add(Faq.fromJson(e));
// //      });
// //      return faqList;
// //    } catch (e) {
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      return null;
// //    }
// //  }
// //
// //  ///
// //  /// This function will get FAQs from database
// //  ///
// //  updateProfile(EditProfileBody body) async {
// //    Dio dio = ApiServices().launch();
// //    BaseResponse baseResponse = BaseResponse();
// //    print('@updateProfile: ${jsonEncode(body)}');
// //    try {
// //      ///
// //      /// Update data in firebase first
// //      ///
// //      final user = FirebaseAuth.instance.currentUser;
// //      await user.updateEmail(body.email.toString().trim());
// ////      await user.updatePassword(body.password);
// //
// //      ///
// //      /// Update in the custom backend
// //      ///
// //      FormData formData = FormData.fromMap(body.toJson());
// //      final Response response = await dio.put(
// //          "${EndPoint.baseUrl}${EndPoint.updateDoctorProfile}",
// //          data: formData);
// //      baseResponse = BaseResponse.fromJson(response.data);
// //      return baseResponse;
// //    } on FirebaseAuthException catch (e) {
// //      baseResponse.success = false;
// //      baseResponse.addError(e.message.toString());
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      return baseResponse;
// //    } catch (e) {
// //      baseResponse.success = false;
// //      baseResponse.addError(e.toString());
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      return baseResponse;
// //    }
// //  }
// //
// //  getAuthenticatedDoctorProfile() async {
// //    Dio dio = ApiServices().launch();
// //    print('@getFAQList');
// //    try {
// //      final Response response = await dio
// //          .get("${EndPoint.baseUrl}${EndPoint.getAuthenticatedDoctor}");
// //      print(response);
// //      BaseResponse _resp = BaseResponse.fromJson(response.data);
// //      if (_resp.success) {
// //        return EditProfileBody.fromJson(response.data['data']);
// //      } else {
// //        return null;
// //      }
// //    } catch (e) {
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      return null;
// //    }
// //  }
// //
// //  getNotifications() async {
// //    Dio dio = ApiServices().launch();
// //    print('@getNotifications');
// //    await Future.delayed(Duration(seconds: 1));
// //    try {
// ////      final Response response = await dio
// ////          .get("${EndPoint.baseUrl}${EndPoint.getNotifications}");
// ////      print(response);
// ////      BaseResponse _resp = BaseResponse.fromJson(response.data);
// ////      if (_resp.success) {
// ////        return EditProfileBody.fromJson(response.data['data']);
// ////      } else {
// ////        return null;
// ////      }
// //    } catch (e) {
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      return null;
// //    }
// //  }
// //
// //  getAllDocuments() async {
// //    Dio dio = ApiServices().launch();
// //    DocumentsResponse documentResponse = DocumentsResponse();
// //    print('@getAllDocuments');
// //    try {
// //      final response =
// //          await dio.get("${EndPoint.baseUrl}${EndPoint.getAllDocs}");
// //      print(response);
// //      documentResponse = DocumentsResponse.fromJson(response.data);
// //      return documentResponse;
// //    } catch (e, s) {
// //      documentResponse.success = false;
// //      documentResponse.addError(e.toString());
// //      print('Exception @DatabaseService/getFAQList: $e');
// //      print(s.toString());
// //      return documentResponse;
// //    }
// //  }
// //
//   uploadHealthInfo(
//     File file,
//   ) async {
//     Dio dio = ApiServices().launch();
//     print('@uploadHealthInfo:');
// //    FileUploadResponse fileUploadResponse = FileUploadResponse();
//     try {
//       FormData formData = FormData.fromMap({
//         'passport': await MultipartFile.fromFile(file.path),
//       });
//       final response = await dio
//           .post("${EndPoint.baseUrl}${EndPoint.healthInfo}", data: formData);
//       print('@uploadHealthInfo, Response: ${response.data}');
// //      fileUploadResponse = FileUploadResponse.fromJson(response.data);
// //      return fileUploadResponse;
//     } catch (e) {
//       print('Exception @UploadDoc: $e');
// //      fileUploadResponse.success = false;
// //      fileUploadResponse.addError(e.toString());
// //      return fileUploadResponse;
//     }
//   }

// //
//   verifyToken(token) async {
//     Dio dio = ApiServices().launch();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.verifyToken}",
//           data: {'token': token});
//       if (response.statusCode == 401) {
//         return false;
//       } else {
//         return true;
//       }
//     } catch (e) {
//       print('Exception @verifyToken: $e');
//       return false;
//     }
//   }

//   refreshToken(token) async {
//     Dio dio = ApiServices().launch();

//     var refreshTokenBody = RefreshTokenBody();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.refreshToken}",
//           data: {'refresh': token});
//       if (response.statusCode == 401) {
//         refreshTokenBody.status = false;
//         return refreshTokenBody;
//       } else {
//         refreshTokenBody.status = true;
//         refreshTokenBody.token = response.data['access'];
//         return refreshTokenBody;
//       }
//     } catch (e) {
//       print('Exception @refreshToken: $e');
//       refreshTokenBody.status = false;
//       return refreshTokenBody;
//     }
//   }

// //
//   logout() async {
//     await locator<AuthDataService>().clear();
//     await FirebaseAuth.instance.signOut();
//   }

//   sendNotification(
//       {fCMtoken, userName, callType, patientId, conversationId}) async {
//     final fcmToken = fCMtoken;
//     // 'ef-KxIlWRcaQs4QSoYhCjk:APA91bGAoiPUOh-39DAhpoiPBZi9V7lJXhGXpikJnnbWzqIM_Lm4nKY_H2gdpV4EaEiMh_B5xnbEQQ07Fev-B5IA9hGiBPuliPv3qjcJVjYuTLKlRG4z_UCrnCkkjQPrG08jJQVKElKl';
//     //fcmServerKey will remain same
//     final fcmServerKey =
//         'AAAATzKaTZw:APA91bEwaY1SFqpUBmheSnFFnzp1505HgEHRQsnDrf9CGxK1yQEPDwPUu71-UDivUV7u2pBrPfgsnR7nnnTwhGABqHdQ_RNKHyeRyYXHo5P2PHYQEG55GKKP_kGjaeC_4PJFGJLTJ_hg';
//     final dio = Dio();
//     dio.options.headers['Content-Type'] = 'application/json';
//     dio.options.headers["Authorization"] = 'key=$fcmServerKey';
//     final sendFcmApi = 'https://fcm.googleapis.com/fcm/send';
//     final response = await dio.post(
//       '$sendFcmApi',
//       data: {
//         'notification': {
//           'body': 'New Appointment call',
//           'title': '$userName want to start a call for consultation'
//         },
//         'priority': 'high',
//         'data': {
//           'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//           'type': '$callType', // audio_call, video_call,
//           'patient_id': '$patientId',
//           'conversation_id': '$conversationId',
//         },
//         'to': '$fcmToken',
//       },
//     );

//     print('@sendNotification: Response: $response');
//   }

//   createConsultationReview(ConsultationReview consultationReview) async {
//     print("@CreateConsultationReview");
//     Dio dio = ApiServices().launch();
//     BaseResponse baseResponse = new BaseResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.createConsultationReview}",
//           data: consultationReview.toJson());
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print("@CreateconsultationReview/Exception ==> $e");
//     }
//   }

//   Future<Profile> getFirebaseProfile(id) async {
//     Profile profile = Profile();
//     try {
//       DataSnapshot snapshot =
//           await firebaseDbRef.child('users').child(id).once();
//       if (snapshot.value != null) {
//         profile =
//             Profile.fromJson(new Map<String, dynamic>.from(snapshot.value));
//       }
//     } catch (e) {
//       print('Exception @getProfile: $e');
//     }
//     if (profile != null) {
//       return profile;
//     } else {
//       return Profile(name: null, imgUrl: null);
//     }
//   }

//   ///
//   ///This function is used for adding firebase user to FIREBASE RTDB
//   ///
//   addFirebaseUser(Profile profile) async {
//     print("PROFILE ID ===> ${profile.id}");
//     print("@AddFirebaseUser");
//     try {
//       await firebaseDbRef
//           .child('users')
//           .child(profile.id)
//           .set(profile.toJson());
//     } catch (e) {
//       print("Exception @AddFirebaseUser ===> $e");
//     }
//   }

//   ///
//   ///This function is used for adding user vitals of user to database
//   ///
//   addUserVitals(UserVitals userVitals) async {
//     Dio dio = ApiServices().launch();
//     print('@AddingUserVitals: ====>${userVitals.toJson2()}');
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.addUserVitals}",
//           data: userVitals.toJson2());
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       if (baseResponse.success) {
//         return baseResponse;
//       }

//       return baseResponse;
//     } catch (e) {
//       print('Exception @AddUserVitals: $e');
//       throw e.toString();
//     }
//   }

//   payConsultation(Checkout checkout) async {
//     Dio dio = ApiServices().launch();
//     print('@PayConsultation: ====>${checkout.toJson()}');
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       final response = await dio.post(
//           "${EndPoint.baseUrl}${EndPoint.payConsultaiton}",
//           data: checkout.toJson2());
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print('Exception @PayConsultation: $e');
//       // throw e.toString();
//     }
//   }

// //
// //  static logError(e, s, {response}) {
// //    final dbRef = FirebaseDatabase.instance.reference().child('ponasasa');
// //    dbRef.child('logs').push().set({
// //      'stack_trace': s.toString(),
// //      'exception': e.toString(),
// //      'response': response?.toString(),
// //    });
// //  }
// //
// //  static logResponse(response) {
// //    final dbRef = FirebaseDatabase.instance.reference().child('ponasasa');
// //    dbRef
// //        .child('httpResponseLogs')
// //        .push()
// //        .set({'response': response.data.toString()});
// //  }

//   updateUserPresence(firebaseUid) async {
//     try {
//       Map<String, dynamic> presenceStatusTrue = {
//         'isOnline': true,
//       };

//       await firebaseDbRef
//           .child("doctors")
//           .child(firebaseUid)
//           .update(presenceStatusTrue)
//           .whenComplete(() => print('Updated doctor PRESENCE'))
//           .catchError((e) => print(e));

//       Map<String, dynamic> presenceStatusFalse = {
//         'isOnline': false,
//       };

//       firebaseDbRef
//           .child("doctors")
//           .child(firebaseUid)
//           .onDisconnect()
//           .update(presenceStatusFalse);
//     } catch (e, s) {
//       print("Exception/UpdateUserPresence/==> $e  \n stackTrace ==> $s");
//     }
//   }

//   ///
//   ///This function will do a refill post request to the backend
//   ///
//   doRefill(Prescription prescription) async {
//     Dio dio = ApiServices().launch2();
//     print('@DoRefill===> ${prescription.toJson()}');
//     BaseResponse baseResponse = BaseResponse();
//     try {
//       Map<String, dynamic> data = prescription.toJson();
//       data['refill_image'] =
//           await MultipartFile.fromFile(prescription.imageFile.path.toString());

//       FormData formData = FormData.fromMap(data);
//       Response response = await dio.post(
//         "${EndPoint.baseUrl}${EndPoint.doRefill}",
//         data: formData,
//       );
//       print('Response: $response');
//       baseResponse = BaseResponse.fromJson(response.data);
//       return baseResponse;
//     } catch (e) {
//       print('Exception @DoRefill: $e');
//     }
//   }
// }
