<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Jogo da Memória com Imagens</title>
  <style>
    body {
      background: #f0f0f0;
      font-family: Arial, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    h1 {
      margin-bottom: 30px;
      color: #333;
    }

    .tabuleiro {
      display: grid;
      grid-template-columns: repeat(4, 100px);
      gap: 15px;
    }

    .carta {
      width: 100px;
      height: 100px;
      background-color: #999;
      border-radius: 10px;
      position: relative;
      cursor: pointer;
      overflow: hidden;
    }

    .carta img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      display: none;
    }

    .carta.revelada img,
    .carta.acertou img {
      display: block;
    }
  </style>
</head>
<body>

  <h1>Jogo da Memória</h1>
  <div class="tabuleiro" id="tabuleiro"></div>

  <script>
    const imagens = [
      'https://motos0km.com.ar/models/honda-crf-230-f-gallery-120181102221823.jpg',
      'https://th.bing.com/th/id/R.60c292193af01966ea5702a45b6eb8a1?rik=jQNTzOR5AEfFOg&pid=ImgRaw&r=0',
      'https://www.dirtrider.com/resizer/yRpCubOSpMUo2sDnQXpF1XwU7OY=/1200x900/filters:focal(590x431:600x441)/cloudfront-us-east-1.images.arcpublishing.com/octane/U2MOAV3K4BEIRNDM3KHF4H3KUE.jpg',
      'https://th.bing.com/th/id/R.dcef72086f2692f4c9ceb7325526abfc?rik=Ha5nebKdhwxMUA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-V4b7Tg-KlGE%2fUYOyRAO4aHI%2fAAAAAAAAr_E%2fGjaf6ixiasQ%2fs1600%2fYamaha%2bYZ%2b450%2bFM%2bMX1%2b2013%2b11.jpg&ehk=cmWjplquDYj66KvPfb6aUFpg%2fm1FgmpTRIqoRheIgdY%3d&risl=&pid=ImgRaw&r=0'
    ];

    const cartas = [...imagens, ...imagens]; // 2 de cada imagem
    cartas.sort(() => 0.5 - Math.random());  // Embaralhar

    const tabuleiro = document.getElementById('tabuleiro');
    let primeiraCarta = null;
    let segundaCarta = null;
    let bloqueado = false;

    cartas.forEach((src, i) => {
      const carta = document.createElement('div');
      carta.classList.add('carta');
      carta.dataset.img = src;

      const img = document.createElement('img');
      img.src = src;
      carta.appendChild(img);

      carta.addEventListener('click', () => {
        if (bloqueado || carta.classList.contains('revelada') || carta.classList.contains('acertou')) return;

        carta.classList.add('revelada');

        if (!primeiraCarta) {
          primeiraCarta = carta;
        } else {
          segundaCarta = carta;
          bloqueado = true;

          if (primeiraCarta.dataset.img === segundaCarta.dataset.img) {
            primeiraCarta.classList.add('acertou');
            segundaCarta.classList.add('acertou');
            limparSelecao();
          } else {
            setTimeout(() => {
              primeiraCarta.classList.remove('revelada');
              segundaCarta.classList.remove('revelada');
              limparSelecao();
            }, 1000);
          }
        }
      });

      tabuleiro.appendChild(carta);
    });

    function limparSelecao() {
      primeiraCarta = null;
      segundaCarta = null;
      bloqueado = false;
    }
  </script>

</body>
</html>