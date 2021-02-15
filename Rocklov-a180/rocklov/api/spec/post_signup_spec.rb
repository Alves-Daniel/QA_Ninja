require_relative "routes/signup"
require_relative "libs/mongo"

describe "POST /signup" do
  context "novo usuário" do
    before(:all) do
      payload = { name: "Pitty", email: "pitty@live.com", password: "qwd123" }
      MongoDB.new.remove_user(payload[:email])

      @result = Signup.new.create(payload)
    end

    it "valida status code " do
      expect(@result.code).to eql 200
    end

    it "valida id do usuário" do
      expect(@result.parsed_response["_id"].length).to eql 24
    end
  end
  context "usuário já existe" do
    before(:all) do
      # Dado que eu tenho um novo usuário
      payload = { name: "João da Silva", email: "joao@hotmail.com", password: "qwd123" }
      MongoDB.new.remove_user(payload[:email])

      # E o email desse usuário já foi cadastrado no sistema
      Signup.new.create(payload)

      # Quando faço uma resquisição para a rota /signup
      @result = Signup.new.create(payload)
    end

    it "deve retornar 409" do
      # Então deve retornar 409
      expect(@result.code).to eql 409
    end

    it "deve retornar mensagem" do
      expect(@result.parsed_response["error"]).to eql "Email already exists :("
    end

    examplos = [
      {
        title: "nome em branco",
        payload: { name: "", email: "felipe@gmail.com", password: "123456" },
        code: 412,
        error: "required name",

      },
      {
        title: "sem o campo nome",
        payload: { email: "felipe@gmail.com", password: "123456" },
        code: 412,
        error: "required name",
      },
      {
        title: "email em branco",
        payload: { name: "Felipe Medeiros e Silva", email: "", password: "123456" },
        code: 412,
        error: "required email",
      },
      {
        title: "sem o campo email",
        payload: { name: "Felipe Medeiros e Silva", password: "123456" },
        code: 412,
        error: "required email",
      },
      {
        title: "senha em branco",
        payload: { name: "Felipe Medeiros e Silva", email: "felipe@gmail.com", password: "" },
        code: 412,
        error: "required password",
      },
    ]
    examplos.each do |e|
      context "#{e[:title]}" do
        before(:all) do
          @result = Signup.new.create(e[:payload])
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
end
