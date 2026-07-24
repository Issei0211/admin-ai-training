notices = [
  {
    title: "メンテナンスのお知らせ",
    body: "7月25日 2:00 から 4:00 まで、システムメンテナンスを実施します。\n作業中は一部機能をご利用いただけない場合があります。"
  },
  {
    title: "新機能リリースのお知らせ",
    body: "Notice管理画面を追加しました。\n一覧、詳細、新規作成、編集、削除の動作確認にご利用ください。"
  },
  {
    title: "夏季休業期間のサポートについて",
    body: "8月13日から8月16日まで、サポート窓口の返信に通常よりお時間をいただきます。"
  }
]

notices.each do |attributes|
  Notice.find_or_create_by!(title: attributes[:title]) do |notice|
    notice.body = attributes[:body]
  end
end
