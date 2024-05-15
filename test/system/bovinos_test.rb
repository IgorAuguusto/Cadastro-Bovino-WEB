require "application_system_test_case"

class BovinosTest < ApplicationSystemTestCase
  setup do
    @bovino = bovinos(:one)
  end

  test "visiting the index" do
    visit bovinos_url
    assert_selector "h1", text: "Bovinos"
  end

  test "should create bovino" do
    visit bovinos_url
    click_on "New bovino"

    fill_in "Brinco", with: @bovino.brinco
    fill_in "Brinco mae", with: @bovino.brinco_mae
    fill_in "Brinco pai", with: @bovino.brinco_pai
    fill_in "Data nascimento", with: @bovino.data_nascimento
    fill_in "Data prenhes", with: @bovino.data_prenhes
    fill_in "Data ultimo parto", with: @bovino.data_ultimo_parto
    fill_in "Nome", with: @bovino.nome
    fill_in "Raca", with: @bovino.raca
    fill_in "Sexo", with: @bovino.sexo
    fill_in "Situacao", with: @bovino.situacao
    click_on "Create Bovino"

    assert_text "Bovino was successfully created"
    click_on "Back"
  end

  test "should update Bovino" do
    visit bovino_url(@bovino)
    click_on "Edit this bovino", match: :first

    fill_in "Brinco", with: @bovino.brinco
    fill_in "Brinco mae", with: @bovino.brinco_mae
    fill_in "Brinco pai", with: @bovino.brinco_pai
    fill_in "Data nascimento", with: @bovino.data_nascimento
    fill_in "Data prenhes", with: @bovino.data_prenhes
    fill_in "Data ultimo parto", with: @bovino.data_ultimo_parto
    fill_in "Nome", with: @bovino.nome
    fill_in "Raca", with: @bovino.raca
    fill_in "Sexo", with: @bovino.sexo
    fill_in "Situacao", with: @bovino.situacao
    click_on "Update Bovino"

    assert_text "Bovino was successfully updated"
    click_on "Back"
  end

  test "should destroy Bovino" do
    visit bovino_url(@bovino)
    click_on "Destroy this bovino", match: :first

    assert_text "Bovino was successfully destroyed"
  end
end
