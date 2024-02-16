document.addEventListener('turbo:load', () => {
  console.log('turbo:load イベントが発火しました');
  // CSRFトークン(Railsが自動的に生成したもの）をHTMLから取得して変数に保存
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  const LIFF_ID = gon.liff_id;

  // LIFF SDKを初期化し、LIFF_IDを使ってLIFFアプリを起動する
  liff
    .init({
      liffId: LIFF_ID,
      withLoginOnExternalBrowser: true
    })

  liff
    .ready.then(() => {
      // ログインしているユーザーのIDトークンを取得
      const idToken = liff.getIDToken()
      const body = `idToken=${encodeURIComponent(idToken)}`
      // HTTP POSTリクエストを使い、取得したIDトークンをバックエンドの/usersエンドポイントに送信
      const request = new Request('/users', {
            headers: {
              // 送信するデータのタイプを指定。ここではURLエンコードされたフォームデータを送信
              'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
              // CSRF攻撃から保護するためのトークン。サーバーにリクエストが信頼できるものであることを伝える
              'X-CSRF-Token': token
          },
          method: 'POST',
          body: body
      });

      fetch(request)
      .then(response => response.json())
      .then(data => {
        data_id = data
      })
    })
  })

  // sendButtonにイベントリスナーを追加
  const sendButton = document.getElementById('send_gift_button');
  console.log('sendButton:', sendButton);

  if (sendButton) {
    sendButton.addEventListener('click', () => {
      console.log('ボタンがクリックされました！');

      liff
        .shareTargetPicker(
          [
            {
              "type": "template",
              "altText": "This is a buttons template",
              "template": {
                "type": "buttons",
                "thumbnailImageUrl": "https://res.cloudinary.com/dk4bsjak1/image/upload/v1707445593/Thankyoupon_dj47bx.png",
                "imageAspectRatio": "rectangle",
                "imageSize": "cover",
                "imageBackgroundColor": "#FFFFFF",
                "text": "感謝を込めて、ありがとうのクーポンを贈ります",
                "actions": [
                  {
                    "type": "uri",
                    "label": "クーポン券を見る",
                    // クーポン券詳細ページ、もしくは専用ページに変更する
                    "uri": "https://res.cloudinary.com/dk4bsjak1/image/upload/f_auto/v1707704247/%E8%82%A9%E3%81%9F%E3%81%9F%E3%81%8D%E5%88%B8_p8cqbr.png"
                  }
                ]
              }
            }
          ]
        )
        .then((res) => {
          if (res) {
            // succeeded in sending a message through TargetPicker
            console.log(`[${res.status}] Message sent!`);
            window.location.href = '/static_pages/completion'; // 完了メッセージを表示するページへリダイレクト
          } else {
            // sending message canceled
            console.log("TargetPicker was closed!");
          }
        })
        .catch((error) => {
          // something went wrong before sending a message
          console.error("Something went wrong:", error);
        });
    });
  }
