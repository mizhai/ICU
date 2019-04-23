import 'package:flutter/material.dart';
import 'package:icu/res/res_index.dart';
import 'package:icu/common/common_index.dart';
import 'package:icu/ui/widgets/widgets.dart';
import 'package:icu/ui/pages/pozhuhao/M/catmodel.dart';



class PozhuhaoCatitem extends StatelessWidget {

  const PozhuhaoCatitem(this.model,{Key key}) : super(key: key);
  final Data model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('点击一下');
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
       
        decoration:  BoxDecoration(
                    border:
                    Border(bottom: BorderSide(
                      color: DefaultColours.col_E5E 
                      
                    ))
                  ),
        child: createSubview(model),
      ),

    );
   
  }


  Widget createSubview(Data model) {
    return Row(
      children: <Widget>[
        createIMG(model.thumb),
        createInfo(model),
         
      ],
    );
  }

  Widget createIMG(String url) {
    return ClipRRect(
      borderRadius:const BorderRadius.all(const Radius.circular(4)),
      child: Container(
        width: 50,
        height: 50,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url,
          placeholder: (context, url) => new ProgressView(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
      ),

      )
    );
  }

  Widget createInfo(Data model) {

    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(left: 10,top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  model.name,
                  style: TextStyle(
                      color: DefaultColours.col_333,
                      fontSize: 17
                  ),
                ),
                Text(
                  model.updateTime,
                  style: TextStyle(
                      color: DefaultColours.col_CCC,
                      fontSize: 13
                  ),
                )
              ],
            ),

          
            Text(
              model.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: DefaultColours.col_999,
                   fontSize: 15
              ),

            ),
           
          ],
        ),
      ),

    );
  }
}
