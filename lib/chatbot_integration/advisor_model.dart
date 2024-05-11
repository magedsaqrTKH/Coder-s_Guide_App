class AdvisorModel {
  // The unique identifier of the response.
  String? id;
  // The type of the object in the response.
  String? object;
  // The time the response was created.
  int? created;
  // The model used to generate the response.
  String? model;
  // The choices in the response.
  List<Choice>? choices;
  // The usage details of the API call.
  Usage? usage;

  AdvisorModel({
    this.id,
    this.object,
    this.created,
    this.model,
    this.choices,
    this.usage,
  });


  factory AdvisorModel.fromJson(Map<String, dynamic> json) => AdvisorModel(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],

        choices:
            List<Choice>.from(json["choices"].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
  
        "choices": List<dynamic>.from(choices!.map((x) => x.toJson())),
        "usage": usage!.toJson(),
      };
}

class Choice {
  int index;
  Message message;
  String finishReason;

  Choice({
    required this.index,
    required this.message,
    required this.finishReason,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        index: json["index"],
        message: Message.fromJson(json["message"]),
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "finish_reason": finishReason,
      };
}

class Message {
  String role;
  String content;

  Message({
    required this.role,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        role: json["role"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}

class Usage {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        promptTokens: json["prompt_tokens"],
        completionTokens: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
