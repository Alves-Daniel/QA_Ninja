describe "POST /equipos" do
  before(:all) do
    payload = { email: "tom@gmail.com", password: "123456" }
    result = Sessions.new.login(payload)
    @user_id = result.parsed_response["_id"]
  end

  context "novo equipo" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("kramer.jpg"),
        name: "Kramer Eddie Van Halen",
        category: "Cordas",
        price: 299,
      }

      MongoDB.new.remove_equipo(payload[:name], @user_id)

      @result = Equipos.new.create(payload, @user_id)
    end

    it "Deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end

  context "não autorizado" do
    before(:all) do
      payload = {
        thumbnail: Helpers::get_thumb("baixo.jpg"),
        name: "Contra baixi",
        category: "Cordas",
        price: 50,
      }

      @result = Equipos.new.create(payload, nil)
    end

    it "Deve retornar 401" do
      expect(@result.code).to eql 401
    end
  end
end
