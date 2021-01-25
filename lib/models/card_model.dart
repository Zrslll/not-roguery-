class CardModel {
  const CardModel({
    this.id,
    this.row,
    this.seq_num,
    this.text,
  });

  final int id;

  final String row;

  final int seq_num;

  final String text;

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        row = json['row'],
        seq_num = json['seq_num'],
        text = json['text'];
}
