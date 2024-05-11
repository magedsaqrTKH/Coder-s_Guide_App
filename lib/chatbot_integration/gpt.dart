import 'dart:convert';
import 'package:http/http.dart' as http;
import 'advisor_model.dart';

class Response {
  AdvisorModel advisorModel = AdvisorModel();
  var choices = <Choice>[];
  String apiKey =
      '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'; //replace with your api key
  Future<dynamic> askAi(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'content-type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "temperature": 0,
            "max_tokens": 500,
            "top_p": 1,
            "messages": [
              {"role": "system", "content": "You are a computer science career path advisor named pulga that assists users in their career path choices, you must provide courses recommendations (only when asked about courses) for beginners, intermediates, and professionals based on courses' ratings and write the ratings beside each course, if the user already took courses, provide him with details on how to write his CV and apply for a job, also recommend some tricks and tips on how to act in an interview and how to answer questions without pressure, if the user seeks guidnace in his path ask him if he's recently graduated or has a job, if he's recently graduated ask for his interests and level of experience and guide him based on his job interests, if he's already working recommend him with courses related to his job,"},
              {
                "role": "user",
                "content":
                    "act as computer science career path advisor: $prompt"
              }
            ],
          },
        ),
      );
      print(response.body);
      // print('Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      advisorModel = AdvisorModel.fromJson(jsonDecode(response.body));
      choices = advisorModel.choices!;
      return choices[0].message.content;
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
