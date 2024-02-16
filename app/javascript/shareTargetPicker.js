document.addEventListener('turbo:load', () => {
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
        })
      })
    } else {
      console.log('ボタンが見つかりません');
    }
  })