import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider_riverpod/search_provider.dart';
import 'package:state_provider_riverpod/slider_provider.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    log('Full Build');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Riverpod Test",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value){
                ref.read(searchProvider.notifier).search(value);
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final search = ref.watch(searchProvider.select((state) => state.search));
               return Text(search,style: TextStyle(fontSize: 20,color: Colors.red),);
              },
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final slider = ref.watch(sliderProvider.select((state) => state.showPassword ));
                    log('Show Password');
                    return InkWell(
                      onTap: () {
                        final slidProvider = ref.read(sliderProvider.notifier);
                        slidProvider.state = slidProvider.state.copyWith(showPassword: !slider);
                      },
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: slider ? Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye_outlined),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                    final slider = ref.watch(sliderProvider.select((state)=>state.slider));
                    log('Red Container');
                    return Container(
                      height: 200,
                      width: 200,
                      color: Colors.red.withOpacity(slider),
                    );
                  },
                ),
              ],),
            Consumer(builder: (context,ref,build){
              final slider = ref.watch(sliderProvider);
              return Slider(value: slider.slider, onChanged: (value){
                final slidProvider = ref.read(sliderProvider.notifier);
                slidProvider.state = slidProvider.state.copyWith(slider: value);
              });
            }),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                log('Toggle Switch');
                final isChange = ref.watch(searchProvider.select((state)=> state.isChange));
                return Switch(value: isChange, onChanged: (value){
                  ref.read(searchProvider.notifier).onChange(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


