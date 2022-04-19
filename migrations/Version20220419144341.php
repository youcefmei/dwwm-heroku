<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220419144341 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE answer_correct');
        $this->addSql('ALTER TABLE admin CHANGE firstname firstname VARCHAR(190) NOT NULL, CHANGE lastname lastname VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE answer_wrong CHANGE title title VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE course CHANGE title title VARCHAR(190) NOT NULL, CHANGE slug slug VARCHAR(190) NOT NULL, CHANGE image image VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE lesson CHANGE slug slug VARCHAR(190) NOT NULL, CHANGE title title VARCHAR(190) NOT NULL, CHANGE media media VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE question CHANGE title title VARCHAR(190) NOT NULL, CHANGE correct_response correct_response VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE quiz CHANGE title title VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE section CHANGE title title VARCHAR(190) NOT NULL, CHANGE slug slug VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE student CHANGE username username VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE teacher CHANGE firstname firstname VARCHAR(190) NOT NULL, CHANGE lastname lastname VARCHAR(190) NOT NULL, CHANGE image image VARCHAR(190) NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE email email VARCHAR(190) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE answer_correct (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE admin CHANGE firstname firstname VARCHAR(255) NOT NULL, CHANGE lastname lastname VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE answer_wrong CHANGE title title VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE course CHANGE title title VARCHAR(255) NOT NULL, CHANGE slug slug VARCHAR(255) NOT NULL, CHANGE image image VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE lesson CHANGE slug slug VARCHAR(255) NOT NULL, CHANGE title title VARCHAR(255) NOT NULL, CHANGE media media VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE question CHANGE title title VARCHAR(255) NOT NULL, CHANGE correct_response correct_response VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE quiz CHANGE title title VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE section CHANGE title title VARCHAR(255) NOT NULL, CHANGE slug slug VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE student CHANGE username username VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE teacher CHANGE firstname firstname VARCHAR(255) NOT NULL, CHANGE lastname lastname VARCHAR(255) NOT NULL, CHANGE image image VARCHAR(255) NOT NULL');
        $this->addSql('ALTER TABLE user CHANGE email email VARCHAR(180) NOT NULL');
    }
}
