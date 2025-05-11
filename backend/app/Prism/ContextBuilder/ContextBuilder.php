<?php

namespace App\Prism\ContextBuilder;

class ContextBuilder
{
    public static function buildContext($row, $selectedChunks)
    {
        $contextData = [];

        foreach ($selectedChunks as $key) {
            $value = $row->$key;
            if (!empty($value)) {
                $contextData[$key] = $value;
            }
        }
        $contextText = '';
        foreach ($contextData as $key => $value) {
            $contextText .= ucfirst(str_replace('_', ' ', $key)) . ': ' . $value . "\n";
        }
    }
}