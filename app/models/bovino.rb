class Bovino < ApplicationRecord
    # Validações de presença e formato
    validates :brinco, presence: true, uniqueness: true, length: { is: 8 }, format: { with: /\A[A-Za-z0-9]+\z/, message: "somente permite letras e números" }
    validates :nome, presence: true, length: { maximum: 20 }
    validates :situacao, presence: true, inclusion: { in: ["Em Lactação", "Seca", "Vendido", "Morto"], message: "%{value} não é uma situação válida" }
    validates :sexo, presence: true, inclusion: { in: %w[Macho Fêmea], message: "%{value} não é um sexo válido" }
    validates :raca, presence: true, inclusion: { in: ["Girolando", "Holandês", "Gir", "Jersey"], message: "%{value} não é uma raça válida" }
    validates :data_nascimento, presence: true
  
    # Validação de brinco da mãe e do pai
    validate :validar_brinco_mae
    validate :validar_brinco_pai
  
    # Validação de atributos específicos para fêmeas
    validate :validar_dados_femea
  
    private
  
    def validar_brinco_mae
      if brinco_mae.present?
        mae = Bovino.find_by(brinco: brinco_mae)
        if mae.nil?
          errors.add(:brinco_mae, "não encontrado")
        elsif mae.sexo != "Fêmea"
          errors.add(:brinco_mae, "não se refere a uma fêmea")
        end
      end
    end
  
    def validar_brinco_pai
      if brinco_pai.present?
        pai = Bovino.find_by(brinco: brinco_pai)
        if pai.nil?
          errors.add(:brinco_pai, "não encontrado")
        elsif pai.sexo != "Macho"
          errors.add(:brinco_pai, "não se refere a um macho")
        end
      end
    end
  
    def validar_dados_femea
      if sexo == "Fêmea"
        if data_prenhes.present? && data_prenhes > Date.today
          errors.add(:data_prenhes, "não pode ser no futuro")
        end
        if data_ultimo_parto.present? && data_ultimo_parto > Date.today
          errors.add(:data_ultimo_parto, "não pode ser no futuro")
        end
      else
        errors.add(:data_prenhes, "não pode ser preenchida para machos") if data_prenhes.present?
        errors.add(:data_ultimo_parto, "não pode ser preenchida para machos") if data_ultimo_parto.present?
      end
    end
  end
  