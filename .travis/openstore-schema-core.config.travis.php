<?php

use OpenstoreSchema\Core\Configuration;

return [
    'database' => [
        'driver'   => 'mysqli',
        'user'     => 'root', // user
        'host'     => 'localhost',
        'password' => '', // password
        'dbname'   => 'openstore_test_utf8mb4',
        'charset' => 'utf8mb4'
        
    ],
    'env' => 'development',
    // Path used to generate proxy classes (see doctrine)
    'proxy_path' => sys_get_temp_dir(),
    'paths' => Configuration::getEntityPaths(),
    'namespace' => Configuration::getEntityNamespace(),
    /*
    // Alternatively you can configure paths and namespace manually
    'namespace' => 'OpenstoreSchema\Core\Entity',
    'paths' => [
        realpath(__DIR__ . "/../vendor/openstore/schema-core/src/OpenstoreSchema/Core/Entity"),
        //realpath(__DIR__ . "/../src/Openstore/Schema/Core/Entity")
    ],
     */
];

