<?php

namespace App\Entities;

use Prism\Prism\Prism;
use Prism\Prism\Enums\Provider;
use Prism\Prism\Schema\ObjectSchema;
use Prism\Prism\Schema\StringSchema;

class PrismHelper
{


    public static function makeStringSchemas(array $objects): array
    {
        $schemas = [];

        foreach ($objects as $obj) {
            if (isset($obj['role']) && isset($obj['content'])) {
                \Log::info('Role: ' . $obj['role']);
                \Log::info('Content: ' . $obj['content']);
                $schemas[] = new StringSchema($obj['role'], $obj['content']);
            }
        }

        return $schemas;
    }

    public static function buildSchema($name,$description,array $properties,array $requiredFields): array
    {
       return new ObjectSchema(
                name: $name,
                description: $description,
                properties: $properties,
                requiredFields: $requiredFields
            );
    }
}
