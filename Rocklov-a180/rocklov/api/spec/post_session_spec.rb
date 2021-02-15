require_relative "routes/sessions"
require_relative "helpers"
#DRY Don't Repeat Yourself => Não se Repita
describe "POST /sessions" do
  context "login com sucesso" do
    before(:all) do
      payload = { email: "oliveira@gmail.com", password: "qwerty" }
      @result = Sessions.new.login(payload)
    end
    it "valida status code " do
      expect(@result.code).to eql 200
    end
    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
  # examplos = [
  #   {
  #     title: "usuário não existe",
  #     payload: { email: "404@gmail.com", password: "1232" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "email em branco",
  #     payload: { email: "", password: "1232" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "sem o campo email",
  #     payload: { password: "1232" },
  #     code: 412,
  #     error: "required email",
  #   },
  #   {
  #     title: "senha incorreta",
  #     payload: { email: "oliveira@gmail.com", password: "1232" },
  #     code: 401,
  #     error: "Unauthorized",
  #   },
  #   {
  #     title: "senha em branco",
  #     payload: { email: "oliveira@gmail.com", password: "" },
  #     code: 412,
  #     error: "required password",
  #   },
  #   {
  #     title: "sem o campo senha",
  #     payload: { email: "oliveira@gmail.com" },
  #     code: 412,
  #     error: "required password",
  #   },
  # ]

  examplos = Helpers::get_fixture("login")

  examplos.each do |e|
    context "#{e[:title]}" do
      before(:all) do
        @result = Sessions.new.login(e[:payload])
      end
      it "valida status code #{e[:code]}" do
        expect(@result.code).to eql e[:code]
      end
      it "valida id do usuário" do
        expect(@result.parsed_response["error"]).to eql e[:error]
      end
    end
  end
end
