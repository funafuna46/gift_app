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
