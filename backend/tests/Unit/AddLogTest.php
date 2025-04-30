<?php

namespace Tests\Unit;

use Mockery;
use App\Models\Log;
use App\Services\LogService\LogService;
use PHPUnit\Framework\TestCase;

class AddLogTest extends TestCase
{
    
    /**
     * A basic unit test example.
     */
    public function testAddLog(): void
    {
        $logService = new LogService();
        $ip = '8.8.8.8';
        $action = 'login';
        $success = true;
        $userId = 1;
        
       
        $logMock = Mockery::mock(Log::class);
        $logMock->shouldReceive('create')
            ->once()
            ->with($ip, $action, $success, $userId)
            ->andReturn(true);
    }
}
