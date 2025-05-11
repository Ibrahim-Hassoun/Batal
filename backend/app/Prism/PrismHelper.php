<?php

namespace App\Prism;

use Prism\Prism\Prism;
use Prism\Prism\Enums\Provider;
use Prism\Prism\Schema\ObjectSchema;
use Prism\Prism\Schema\StringSchema;
use App\Prism\ChunkSelectors\ChunkSelectors;

class PrismHelper
{


    public static function makeStringSchemas(array $objects): array
    {
        $schemas = [];

        foreach ($objects as $obj) {
            if (isset($obj['role']) && isset($obj['content'])) {
                
                $schemas[] = new StringSchema($obj['role'], $obj['content']);
            }
        }

        return $schemas;
    }

    public static function buildSchema($name,$description,array $properties,array $requiredFields)
    {
       return new ObjectSchema(
                name: $name,
                description: $description,
                properties: $properties,
                requiredFields: $requiredFields
            );
    }

    public static function decideTable()
    {

    }

    public static function decideChunks($table,$userPrompt)
    {
        if($table == 'users')
        {
            $usersChunkSelectionSchema = ChunkSelectors::makeChunkSelector(ChunkSelectors::getUserChunks());
            //usersChunkSelectionSchema will return an array of the needed chunks

            $finalPrompt = "The user asked: '{$userPrompt}'\n" .
                    "From the list of available data, select only the ones most relevant to answering this question.";


            $response = Prism::structured()
            ->using(Provider::OpenAI, 'gpt-4o')
            ->withSchema($usersChunkSelectionSchema)
            ->withPrompt($finalPrompt)
            ->asStructured();
            

            return $response->structured['selected_chunks'];
        }
       
    }
}
