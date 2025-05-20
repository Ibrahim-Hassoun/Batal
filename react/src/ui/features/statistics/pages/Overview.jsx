import React from 'react'

const Overview = () => {
  return (
    <div className='bg-red-500 w-3/4 h-[90%] m-auto flex flex-col gap-6'>
        {/* //split horizontal */}
        <div className='bg-green-500 flex-1 flex gap-3'>
            <div className='bg-white w-1/3 flex flex-col gap-3'>
                <div id='upper-tiles' className='bg-red-500 flex-1 flex'>
                    <div className='flex-1'>tile 1</div>
                    <div className='flex-1'>tile 2</div>
                </div>
                <div id='lower-tiles ' className='bg-red-500 flex-1 flex'>
                    <div className='flex-1'>tile 3</div>
                    <div className='flex-1'>tile 4</div>
                </div>
            </div>
            <div className='bg-black w-2/3'>2</div>
        </div>
        <div className='bg-green-500 flex-1 flex gap-3'>
            <div className='bg-white w-1/3'>1</div>
            <div className='bg-black w-2/3'>2</div>
        </div>
    </div>
  )
}

export default Overview