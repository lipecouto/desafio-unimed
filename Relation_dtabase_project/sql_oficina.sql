
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table `Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes` (
  `idClientes` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `CPF_CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idClientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Veiculo` (
  `idVeiculo` INT NOT NULL,
  `Renavam` INT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  PRIMARY KEY (`idVeiculo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Clientes_has_Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes_has_Veiculo` (
  `Clientes_idClientes` INT NOT NULL,
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`Clientes_idClientes`, `Veiculo_idVeiculo`),
  CONSTRAINT `fk_Clientes_has_Veiculo_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Veiculo_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `Veiculo` (`idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Clientes_has_Veiculo_Veiculo1_idx` ON `Clientes_has_Veiculo` (`Veiculo_idVeiculo` ASC) VISIBLE;

CREATE INDEX `fk_Clientes_has_Veiculo_Clientes1_idx` ON `Clientes_has_Veiculo` (`Clientes_idClientes` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Peças` (
  `idPeças` INT NOT NULL,
  `Referencia` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Estoque` (
  `Controle` VARCHAR(45) NOT NULL,
  `idPeças` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Controle`, `idPeças`),
  CONSTRAINT `fk_Estoque_Peças1`
    FOREIGN KEY (`idPeças`)
    REFERENCES `Peças` (`idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Estoque_Peças1_idx` ON `Estoque` (`idPeças` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servicos` (
  `idServicos` INT NOT NULL,
  `Descricao` VARCHAR(45) NULL,
  `Prazorealizacao` VARCHAR(45) NULL,
  PRIMARY KEY (`idServicos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parceiros_mec`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parceiros_mec` (
  `idparceiros` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereco` VARCHAR(45) COLLATE 'DEFAULT' NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idparceiros`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `cpf_UNIQUE` ON `parceiros_mec` (`Endereco` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe` (
  `idequipe` INT NOT NULL,
  `idparceiros` INT NOT NULL,
  PRIMARY KEY (`idequipe`),
  CONSTRAINT `fk_equipe_parceiros1`
    FOREIGN KEY (`idparceiros`)
    REFERENCES `parceiros_mec` (`idparceiros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_equipe_parceiros1_idx` ON `equipe` (`idparceiros` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ordem de Serviço` (
  `Nrounico` INT NOT NULL,
  `idClientes` INT NOT NULL,
  `idVeiculo` INT NOT NULL,
  `Nro_os` VARCHAR(45) NULL,
  `data_emissao` DATETIME NULL,
  `equipe_idequipe` INT NOT NULL,
  `data_conclusao` VARCHAR(45) NULL,
  `StatusOS` VARCHAR(45) NULL,
  `ValorOS` VARCHAR(45) NULL,
  PRIMARY KEY (`Nrounico`, `idClientes`, `idVeiculo`),
  CONSTRAINT `fk_Ordem de Serviço_Clientes_has_Veiculo1`
    FOREIGN KEY (`idClientes` , `idVeiculo`)
    REFERENCES `Clientes_has_Veiculo` (`Clientes_idClientes` , `Veiculo_idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_equipe1`
    FOREIGN KEY (`equipe_idequipe`)
    REFERENCES `equipe` (`idequipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Ordem de Serviço_Clientes_has_Veiculo1_idx` ON `Ordem de Serviço` (`idClientes` ASC, `idVeiculo` ASC) VISIBLE;

CREATE INDEX `fk_Ordem de Serviço_equipe1_idx` ON `Ordem de Serviço` (`equipe_idequipe` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Itens_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Itens_OS` (
  `Ordem de Serviço_Nrounico` INT NOT NULL,
  `Controle` VARCHAR(45) NOT NULL,
  `idPeças` INT NOT NULL,
  `vlrPeca` DECIMAL(2) NOT NULL,
  `quantidade` INT NOT NULL,
  `vlrTotal` DECIMAL(2) NULL,
  PRIMARY KEY (`Ordem de Serviço_Nrounico`, `Controle`, `idPeças`),
  CONSTRAINT `fk_Ordem de Serviço_has_Estoque_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_Nrounico`)
    REFERENCES `Ordem de Serviço` (`Nrounico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem de Serviço_has_Estoque_Estoque1`
    FOREIGN KEY (`Controle` , `idPeças`)
    REFERENCES `Estoque` (`Controle` , `idPeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Ordem de Serviço_has_Estoque_Estoque1_idx` ON `Itens_OS` (`Controle` ASC, `idPeças` ASC) VISIBLE;

CREATE INDEX `fk_Ordem de Serviço_has_Estoque_Ordem de Serviço1_idx` ON `Itens_OS` (`Ordem de Serviço_Nrounico` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `tabela_preco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabela_preco` (
  `idtabela_preco` INT NOT NULL,
  `idServicos` INT NOT NULL,
  `valorMaoObra` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`idtabela_preco`, `idServicos`),
  CONSTRAINT `fk_tabela_preco_Servicos1`
    FOREIGN KEY (`idServicos`)
    REFERENCES `Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_tabela_preco_Servicos1_idx` ON `tabela_preco` (`idServicos` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Servico_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servico_OS` (
  `Nrounico` INT NOT NULL,
  `idServicos` INT NOT NULL,
  `idtabela_preco` INT NOT NULL,
  `valor` VARCHAR(45) NULL,
  PRIMARY KEY (`Nrounico`, `idServicos`),
  CONSTRAINT `fk_Servicos_has_Ordem de Serviço_Servicos1`
    FOREIGN KEY (`idServicos`)
    REFERENCES `Servicos` (`idServicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicos_has_Ordem de Serviço_Ordem de Serviço1`
    FOREIGN KEY (`Nrounico`)
    REFERENCES `Ordem de Serviço` (`Nrounico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_OS_tabela_preco1`
    FOREIGN KEY (`idtabela_preco`)
    REFERENCES `tabela_preco` (`idtabela_preco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Servicos_has_Ordem de Serviço_Ordem de Serviço1_idx` ON `Servico_OS` (`Nrounico` ASC) VISIBLE;

CREATE INDEX `fk_Servicos_has_Ordem de Serviço_Servicos1_idx` ON `Servico_OS` (`idServicos` ASC) VISIBLE;

CREATE INDEX `fk_Servico_OS_tabela_preco1_idx` ON `Servico_OS` (`idtabela_preco` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `financeiroOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `financeiroOS` (
  `idfinanceiroOS` INT NOT NULL,
  `Ordem de Serviço_Nrounico` INT NOT NULL,
  `Ordem de Serviço_idClientes` INT NOT NULL,
  `Ordem de Serviço_idVeiculo` INT NOT NULL,
  `ValorOS` VARCHAR(45) NULL,
  PRIMARY KEY (`idfinanceiroOS`, `Ordem de Serviço_Nrounico`, `Ordem de Serviço_idClientes`, `Ordem de Serviço_idVeiculo`),
  CONSTRAINT `fk_financeiroOS_Ordem de Serviço1`
    FOREIGN KEY (`Ordem de Serviço_Nrounico` , `Ordem de Serviço_idClientes` , `Ordem de Serviço_idVeiculo`)
    REFERENCES `Ordem de Serviço` (`Nrounico` , `idClientes` , `idVeiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_financeiroOS_Ordem de Serviço1_idx` ON `financeiroOS` (`Ordem de Serviço_Nrounico` ASC, `Ordem de Serviço_idClientes` ASC, `Ordem de Serviço_idVeiculo` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
