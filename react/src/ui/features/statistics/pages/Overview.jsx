import React from 'react'
import InfoTiles from '../components/InfoTiles'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCoffee, faUser } from '@fortawesome/free-solid-svg-icons';


const Overview = () => {
  return (
    <div className=' w-3/4 h-[90%] m-auto flex flex-col gap-6 '>
        {/* //split horizontal */}
        <div className=' flex-1 flex gap-3'>
            <div className=' w-1/3 flex flex-col gap-3'>
                <div id='upper-tiles' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faCoffee} title='user' count={500}/>
                    <InfoTiles icon={faCoffee} title='user' count={500}/>
                    
                </div>
                <div id='lower-tiles ' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faCoffee} title='user' count={500}/>
                    <InfoTiles icon={faCoffee} title='user' count={500}/>
                </div>
            </div>
            <div className='bg-black w-2/3'>
            2
            </div>
        </div>

        <div className=' flex-1 flex gap-3'>
            <div className='bg-black flex-1'>2</div>
            <div className='bg-indigo-600 flex-1'>1</div>
            <div className='bg-black flex-1'>2</div>
        </div>
    </div>
  )
}

export default Overview