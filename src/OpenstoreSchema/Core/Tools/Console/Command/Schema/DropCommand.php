<?php

declare(strict_types=1);

/*
 * opentore-schema-core
 *
 * @author    Vanvelthem Sébastien
 * @link      https://github.com/belgattitude/openstore-schema-core
 * @copyright Copyright (c) 2015-2017 Vanvelthem Sébastien
 * @license   MIT License, https://github.com/belgattitude/openstore-schema-core/blob/master/LICENSE.md
 *
 */

namespace OpenstoreSchema\Core\Tools\Console\Command\Schema;

use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Question;
use Symfony\Component\Console\Output\OutputInterface;
use Doctrine\ORM\Tools\SchemaTool;

class DropCommand extends AbstractCommand
{
    /**
     * {@inheritdoc}
     */
    protected function configure(): void
    {
        $this->setName('openstore:schema:drop')
             ->setDescription(
                 'Drop the current database schema.'
             )
        ->setHelp(
            <<<'EOT'
Drop the current database
EOT
        );
    }

    /**
     * {@inheritdoc}
     */
    protected function executeSchemaCommand(InputInterface $input, OutputInterface $output, SchemaTool $schemaTool, array $metadatas): ?int
    {
        $conn = $this->getConnection();
        $current_db = $conn->getDatabase();

        $output->writeln('ATTENTION: This operation should not be executed in a production environment.' . PHP_EOL);

        $qhelper = $this->getHelper('question');

        $question = new Question\ConfirmationQuestion("Are you sure you want to drop database '$current_db' (y/n) ?", false);

        if (!$qhelper->ask($input, $output, $question)) {
            return null;
        }

        $query = "drop database if exists $current_db";
        $ret = $conn->exec($query);

        return 0;
    }
}
