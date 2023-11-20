import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("data"),
          Text(
              "Lorem Laboris laboris laboris fugiat do cillum adipisicing consequat tempor nisi nostrud Lorem Lorem adipisicing. Do officia cillum labore veniam culpa veniam esse. Esse est amet non exercitation officia nostrud mollit duis mollit pariatur laboris sit culpa.Pariatur dolor exercitation commodo eiusmod irure nulla cupidatat esse qui fugiat esse aliquip do eiusmod. Mollit nisi nulla do esse dolore adipisicing. Quis cillum tempor occaecat minim et ipsum ut velit. Proident eiusmod quis enim ullamco consectetur cupidatat mollit dolore aliqua in. Do ex do eu quis consectetur voluptate.Excepteur id fugiat adipisicing in id. Laborum cillum sint sit nostrud duis sint ex exercitation Lorem officia. Ex irure irure magna eiusmod ipsum labore commodo nisi officia. Adipisicing id anim fugiat quis est laborum. Voluptate ex cupidatat tempor culpa duis ut ad quis x irure amet.Sint officia deserunt elit sit. Tempor irure veniam aute eiusmod voluptate incididunt magna cillum cillum. Proident laborum minim qui ipsum cupidatat reprehenderit exercitation voluptate incididunt aute et cupidatat. Elit sunt minim sint cupidatat excepteur. Do do consequat aliquip elit anim occaecat Lorem reprehenderit. Excepteur non irure ad ea.Qui dolore adipisicing fugiat cupidatat laborum commodo commodo ad ex exercitation dolor eiusmod est velit. Et ea Lorem cillum anim elit non nulla voluptate magna. Dolore duis et eiusmod consectetur fugiat veniam sunt.Non ut quis labore velit quis nulla anim officia mollit. Amet nulla aliqua sint sint consectetur exercitation sint mollit. Occaecat dolor sunt anim aliquip ad eiusmod nisi in ullamco anim adipisicing quis cupidatat minim. Laboris nulla incididunt labore irure aliqua excepteur nostrud aliquip ea et minim aute.Sunt veniam enim dolor sit incididunt est duis reprehenderit. Occaecat quis incididunt est nostrud ea in incididunt reprehenderit et aliqua in. Enim ea in sint ut elit fugiat in dolore reprehenderit proident est id. Dolore velit tempor commodo minim laborum deserunt tempor mollit in.Aliquip ex nulla non magna adipisicing adipisicing do. Non ea esse enim consequat ea ea ad veniam labore exercitation. Qui amet ullamco ullamco ex ad quis proident do ad ut. Aliqua enim fugiat mollit dolor ullamco ea aliquip irure ullamco. Anim amet ipsum in laborum commodo aliqua. Ut mollit est consectetur irure id. Occaecat proident eu officia voluptate dolore exercitation consectetur enim."),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red),
                    ),
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size(Get.width * .3, 45)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Souscription"),
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(Get.width * .65, 45)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
