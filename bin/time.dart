import 'dart:async';

class BotClock {
  Stream<int> inputStream() {
    int i = 0;

    return Stream.periodic(Duration(seconds: 1), (int _) => i++);
  }
}

void main() {
  var botClock = BotClock();
  var timeoutStream = botClock.inputStream().listen(
    (event) => print('Tempo ocioso: $event'),
    onDone: () => print('Função deu timeout'),
  );

  // Aqui você pode adicionar a lógica para interromper o timer quando o usuário digitar algo

  // Exemplo de como interromper o timer após 5 segundos
  Timer(Duration(seconds: 5), () {
    timeoutStream.cancel();
  });
}