Dado("Login com {string} e {string}") do |email, password|
  goto_login

  login_with(email, password)
end

Dado("que eu goste muito de {string}") do |cat|
  find("a[href='/search/new']").click
  find("img[src$='#{cat.downcase}.png']").click
end

Quando("toca a seguinte canção:") do |table|
  @parody = table.rows_hash

  find("a", text: @parody[:banda]).click

  song = find(".song-item", text: @parody[:parodia])
  song.find(".fa-play-circle").click
end

Então("essa paródia deve ficar em mode de reprodução") do
  song_play = find(".playing")
  expect(song_play).to have_text @parody[:paradia]
end
