
class PozhuhaolistModel {

  String catname;
  String source;
  String audioUrl;
  int iscollect;
  String title;
  String createTime;
  int hits;
  String truename;
  String size;
  int id;
  String thumb;
  int editorid;
  int catid;
  int audioSize;
  int audioDuration;
  int columnid;
  String createtime;
  int commentCount;
  int audioId;
  String author;

  PozhuhaolistModel(this.catname,this.source,this.audioUrl,this.iscollect,this.title,this.createTime,this.hits,this.truename,
  this.size,this.id,this.thumb,this.editorid,this.catid,this.audioSize,this.audioDuration,this.columnid,this.createtime,this.commentCount,this.audioId,
  this.author);

  PozhuhaolistModel.fromJson(Map<String, dynamic> json):
   id = json['id'],
   catname = json['catname'],
   source = json['source'],
   audioUrl = json['audio_url'],
   iscollect = json['iscollect'],
   title = json['title'],
   createTime = json['create_time'],
   hits = json['hits'],
   truename = json['truename'],
   size = json['size'],
   thumb = json['thumb'],
   editorid = json['editorid'],
   catid = json['catid'],
   audioSize = json['audio_size'],
   audioDuration = json['audio_duration'],
   columnid = json['columnid'],
   createtime = json['createtime'],
   commentCount = json['comment_count'],
   audioId = json['audio_id'],
   author = json['author'];


  Map<String, dynamic> toJson() => {
    'id': id,
    'catname': catname,
    'source': source,
    'audio_url': audioUrl,
    'iscollect': iscollect,
    'title': title,
    'create_time': createTime,
    'hits': hits,
    'truename': truename,
    'size': size,
    'thumb': thumb,
    'editorid': editorid,
    'catid': catid,
    'audio_size': audioSize,
    'audio_duration': audioDuration,
    'columnid': columnid,
    'createtime':createtime,
    'comment_count': commentCount,
    'audio_id': audioId,
    'author': author
  };

}