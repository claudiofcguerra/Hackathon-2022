import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_2022/assets/constants.dart';
import 'package:hackathon_2022/recipeclass.dart';
import 'package:hackathon_2022/swipe.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class SubmitRecipe extends StatefulWidget {
  const SubmitRecipe({Key? key}) : super(key: key);

  @override
  State<SubmitRecipe> createState() => _SubmitRecipeState();
}

class _SubmitRecipeState extends State<SubmitRecipe> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController optionalController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();

  double rating = 0;

  //var l = [TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: ""), TextEditingController(text: ""),TextEditingController(text: "")];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.brown,
            pinned: true,
            expandedHeight: 80.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(start: 22, bottom: 16),
              title: Text('Submete a tua receita'),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              BuildRecipeName(controller: nameController),
              BuildDescriptionField(controller: descriptionController),
              ImageCapture(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Material(
                      type: MaterialType.transparency,
                      child: Text('Qual a dificuldade da receita?',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.black)),
                    ),
                    SmoothStarRating(
                      color: Colors.brown,
                      borderColor: Colors.brown,
                      rating: rating,
                      size: 55,
                      filledIconData: Icons.fastfood,
                      defaultIconData: Icons.fastfood_outlined,
                      starCount: 3,
                      allowHalfRating: false,
                      spacing: 10.0,
                      onRatingChanged: (value) {
                        setState(() {
                          rating = value;
                          //myController.text =
                        });
                      },
                    ),
                  ],
                ),
              ),
              BuildTime(controller: timeController),
              BuildPrice(controller: priceController),
              BuildOptional(controller: optionalController),
              BuildDescription(
                  text: "Ingredientes", controller: ingredientsController),
              BuildDescription(
                  text: "Instruções", controller: instructionsController),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(2, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      // Create a reference to 'images/mountains.jpg'
                      /*const mountainImagesRef = ref(
                          storage, 'images/mountains.jpg');*/

                      addRecipe(RecipeClass(
                          nameController.value.text,
                          FirebaseAuth.instance.currentUser!.uid,
                          descriptionController.value.text,
                          optionalController.value.text,
                          double.parse(timeController.value.text).toInt(),
                          double.parse(priceController.value.text),
                          "images/testFood1.jpeg",
                          0,
                          rating.toInt(),
                          ingredientsController.value.text,
                          instructionsController.value.text));

                      Navigator.pop(context);
                    }, //submit(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Submeter", style: TextStyle(fontSize: 20))
                      ],
                    )),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

class BuildRecipeName extends StatelessWidget {
  TextEditingController controller;

  BuildRecipeName({
    Key? key,
    required this.controller, //required this.myController
  }) : super(key: key);

  //TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 40.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Nome da receita",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class ImageCapture extends StatefulWidget {
  File? image;

  ImageCapture({Key? key}) : super(key: key);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  final imagePicker = ImagePicker();

  Future pickImage(ImageSource source) async {
    try {
      final image = await imagePicker.pickImage(source: source);
      if (image == null) return;

      setState(() => widget.image = File(image.path));
    } on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Material(
              type: MaterialType.transparency,
              child: Text('Fotografia',
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: const CircleBorder(),
              ),
              onPressed: () => pickImage(ImageSource.gallery),
              child: Row(
                children: const [
                  Icon(Icons.image_outlined),
                ],
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: const CircleBorder(),
              ),
              onPressed: () => pickImage(ImageSource.camera),
              child: Row(
                children: const [
                  Icon(Icons.camera_alt_outlined),
                ],
              )),
          widget.image != null
              ? SizedBox(
                  child: Image.file(widget.image!), width: 140, height: 140)
              : const FlutterLogo(size: 0)
        ],
      ),
    );
  }
}

class BuildTime extends StatefulWidget {
  TextEditingController controller;

  BuildTime({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BuildTime createState() => _BuildTime();
}

class _BuildTime extends State<BuildTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Tempo (Minutos)",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class BuildDescriptionField extends StatefulWidget {
  TextEditingController controller;

  BuildDescriptionField({Key? key, required this.controller}) : super(key: key);

  @override
  State<BuildDescriptionField> createState() => _BuildDescriptionFieldState();
}

class _BuildDescriptionFieldState extends State<BuildDescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 40.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: "Descrição",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class BuildPrice extends StatelessWidget {
  TextEditingController controller;

  BuildPrice({
    Key? key,
    required this.controller, //required this.myController
  }) : super(key: key);

  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Preço",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class BuildOptional extends StatelessWidget {
  TextEditingController controller;

  BuildOptional({
    Key? key,
    required this.controller, //required this.myController
  }) : super(key: key);

  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          maxLines: 5,
          //controller: myController,
          decoration: InputDecoration(
            labelText: "Opcional",
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}

class BuildDescription extends StatelessWidget {
  TextEditingController controller;

  BuildDescription(
      {Key? key,
      required this.text,
      required this.controller //required this.myController
      })
      : super(key: key);

  String text;

  //final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(7.0, 25.0, 7.0, 20.0),
      child: Material(
        child: TextFormField(
          controller: controller,
          //controller: myController,
          maxLines: 15,
          decoration: InputDecoration(
            labelText: text,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: const BorderSide(),
            ),
          ),
          style: const TextStyle(
            fontFamily: "Poppins",
          ),
        ),
      ),
    );
  }
}
