<?php

namespace App\Entities;

use OpenSouth\Prism\Types\Schemas\StringSchema;

class PrismHelper
{
    public static function makeStringSchemasFromArray(array $data): array
    {
        $schemas = [];

        foreach ($data as $label => $value) {
            $schemas[] = StringSchema::make()
                ->label($label)
                ->value($value);
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
