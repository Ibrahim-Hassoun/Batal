<?php

namespace App\Entities;

use OpenSouth\Prism\Types\Schemas\StringSchema;
use OpenSouth\Prism\Types\Schemas\ObjectSchema;


class PrismHelper
{
    public static function stringSchemas(array $fields): array
    {
        $schemas = [];

        foreach ($fields as $key => $description) {
            $schemas[] = new StringSchema($key, $description);
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
