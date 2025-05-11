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
}
