document.addEventListener('turbo:load', () => {
  const sendButton = document.getElementById('send_gift_button');
  console.log('sendButton:', sendButton);

  if (sendButton) {
    sendButton.addEventListener('click', () => {
      console.log('ボタンがクリックされました！');
      const shareUrl = sendButton.getAttribute('data-share-url');

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
                    "uri": shareUrl
                  },
                  {
                    "type": "uri",
                    "label": "LINE公式アカウントを友だち追加",
                    "uri": "https://lin.ee/mYViS6T"
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