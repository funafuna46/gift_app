document.addEventListener('turbo:load', () => {
  console.log('turbo:load イベントが発火しました');
  const LIFF_ID = gon.liff_id;
  liff.init({ liffId: LIFF_ID }).then(() => {
    const loggedInMessage = document.getElementById('loggedInMessage');
    const loggedOutMessage = document.getElementById('loggedOutMessage');

    if (liff.isLoggedIn()) {
      if (loggedInMessage) loggedInMessage.style.display = 'block';
    } else {
      // ユーザーがログインしていない場合
      if (loggedOutMessage) loggedOutMessage.style.display = 'block';
      liff.login();
    }
  }).catch((err) => {
    console.error('LIFF Initialization failed', err);
  });

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
                    "uri": "#"
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
});
