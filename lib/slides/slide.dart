import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assest/aboutus.png',
    title: '',
    description:'VikretaG is a technology driven application based platform developed to connects hawkers and customers to serve/fulfil.',
  ),
  Slide(
    imageUrl: 'assest/aboutus.png',
    title: '',
    description: 'VikretaG provides fresh fruits and vegetable to every house of society for healthier life of the people and save their time.',
  ),
  Slide(
    imageUrl: 'assest/aboutus.png',
    title: '',
    description: 'VikretaG not charge any amount neither from customers nor from vendors.it is the direct deal between vendors and customers.',
  ),
];
