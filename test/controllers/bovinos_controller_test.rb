require "test_helper"

class BovinosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bovino = bovinos(:one)
  end

  test "should get index" do
    get bovinos_url
    assert_response :success
  end

  test "should get new" do
    get new_bovino_url
    assert_response :success
  end

  test "should create bovino" do
    assert_difference("Bovino.count") do
      post bovinos_url, params: { bovino: { brinco: @bovino.brinco, brinco_mae: @bovino.brinco_mae, brinco_pai: @bovino.brinco_pai, data_nascimento: @bovino.data_nascimento, data_prenhes: @bovino.data_prenhes, data_ultimo_parto: @bovino.data_ultimo_parto, nome: @bovino.nome, raca: @bovino.raca, sexo: @bovino.sexo, situacao: @bovino.situacao } }
    end

    assert_redirected_to bovino_url(Bovino.last)
  end

  test "should show bovino" do
    get bovino_url(@bovino)
    assert_response :success
  end

  test "should get edit" do
    get edit_bovino_url(@bovino)
    assert_response :success
  end

  test "should update bovino" do
    patch bovino_url(@bovino), params: { bovino: { brinco: @bovino.brinco, brinco_mae: @bovino.brinco_mae, brinco_pai: @bovino.brinco_pai, data_nascimento: @bovino.data_nascimento, data_prenhes: @bovino.data_prenhes, data_ultimo_parto: @bovino.data_ultimo_parto, nome: @bovino.nome, raca: @bovino.raca, sexo: @bovino.sexo, situacao: @bovino.situacao } }
    assert_redirected_to bovino_url(@bovino)
  end

  test "should destroy bovino" do
    assert_difference("Bovino.count", -1) do
      delete bovino_url(@bovino)
    end

    assert_redirected_to bovinos_url
  end
end
