import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:legal_chat/src/controller/auth/login_controller.dart';
import 'package:legal_chat/src/views/theme/theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController _controller = Get.find();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300.h,
                    ),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.symmetric(horizontal: 40.w),

                      child: TextFormField(
                        obscureText: false,
                        cursorHeight: 18.h,
                        controller: _controller.phoneController,
                        autovalidateMode: AutovalidateMode.disabled,
                        style: TextStyle(
                            color: AppColor.content
                        ),
                        onSaved: (value){
                        },
                        validator: (value){

                        },
                        onChanged: (value){

                        },
                        onTap: (){

                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: 'phone'.tr,
                          hintStyle: TextStyle(
                            color: AppColor.content3,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
                          prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 5.w),
                              child: SvgPicture.asset("assets/icons/ic_phone.svg")
                          ),
                          prefixIconConstraints: BoxConstraints(
                              maxHeight: 18.h
                          ),

                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          errorStyle: TextStyle(
                            color: AppColor.accent2,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 16.h,),
                    Container(
                      height: 48.h,
                      margin: EdgeInsets.symmetric(horizontal: 40.w),

                      child: Obx(()=>
                        TextFormField(
                            obscureText: _controller.isObscurePassword.value ? true: false,
                            cursorHeight: 18.h,
                            controller: _controller.passwordTextController,
                            autovalidateMode: AutovalidateMode.disabled,
                            style: const TextStyle(
                                color: AppColor.content
                            ),
                            onSaved: (value){
                            },
                            validator: (value){

                            },
                            onChanged: (value){

                            },
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.8),
                              hintText: 'enter_password'.tr,
                              hintStyle: const TextStyle(
                                color: AppColor.content3,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 16.w, right: 5.w),
                                  child: SvgPicture.asset("assets/icons/ic_lock.svg")
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  maxHeight: 18.h
                              ),
                              suffixIcon: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: (){
                                  _controller.isObscurePassword.value = !_controller.isObscurePassword.value;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16.w),
                                  child: SvgPicture.asset("assets/icons/ic_eye.svg",
                                    color: _controller.isObscurePassword.value? AppColor.content2 : AppColor.fillPositive,

                                  ),
                                ),
                              ),
                              suffixIconConstraints: BoxConstraints(
                                  maxHeight: 29.h
                              ),

                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27)
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27)
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27)
                              ),
                              errorStyle: const TextStyle(
                                color: AppColor.accent2,
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27)
                              ),
                            ),

                          )
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      alignment: Alignment.centerRight,
                      child: Text('forget_password'.tr,
                        style: TextStyle(
                            color: AppColor.content3,
                            fontSize: AppSize.textXs
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      child: CupertinoButton(
                          color: AppColor.fillPositive,
                          borderRadius: BorderRadius.circular(27),
                          child: Center(
                            child: Text('login'.tr,
                              style: const TextStyle(
                                  color: AppColor.content,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          onPressed: (){
                            _controller.login();
                          }),
                    ),

                  ],
                ),
              ),

              Obx(()=>_controller.isLogging.value ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ) : SizedBox())
            ],
          ),
        )
      ),
    );
  }
}
