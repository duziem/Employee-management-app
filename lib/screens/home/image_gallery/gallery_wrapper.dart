import 'package:flutter/material.dart';
import 'package:beloxxi_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:beloxxi_app/screens/home/image_gallery/gallery.dart';
import 'package:beloxxi_app/models/image.dart';

class GalleryWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ImageDoc>>.value(
          value:DatabaseService().image,
          child: Gallery(),
    );
  }
}