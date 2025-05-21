import React from 'react'
import InfoTiles from '../components/InfoTiles'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faBowlFood,  faDumbbell, faPersonChalkboard, faUser } from '@fortawesome/free-solid-svg-icons';
import TableRow from '../components/TableRow';
import BasicBarChart from '../components/BarChart';
import CustomLineChart from '../components/CustomLineChart';
import CustomPieChart from '../components/PieChart';
import OverviewLogic from './OverviewLogic';
import { faCircleNotch } from '@fortawesome/free-solid-svg-icons';
import {  useSelector } from 'react-redux';
const Overview = () => {
    const ChartsState = useSelector((global)=>global.Charts)
    const StatisticsState = useSelector((global)=>global.Statistics)
    const {
        totalDietitians,
        totalTrainers,
        totalUsers,
        totalExercices,
        leaderboard,
        chartsLoading,
        finallineChartData,
        lineChartData,
        renameKeys,
        pieChartData,finalPieChartData
        } = OverviewLogic()

        // setInterval(() => {
        //   console.log( StatisticsState)
        // }, 2000);
       
  return (
    <div className=' w-3/4 h-[90%] m-auto flex flex-col gap-6 '>
        {/* //split horizontal */}
        <div className=' flex-1 flex gap-3'>
            <div className=' w-1/3 flex flex-col gap-3'>
                <div id='upper-tiles' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faUser} title='Total users' count={totalUsers}/>
                    <InfoTiles icon={faBowlFood} title='Dietitians' count={totalDietitians}/>
                    
                </div>
                <div id='lower-tiles ' className=' flex-1 flex gap-2'>
                    <InfoTiles icon={faPersonChalkboard} title='Trainers' count={totalTrainers}/>
                    <InfoTiles icon={faDumbbell} title='user' count={totalExercices}/>
                </div>
            </div>
            <div className='bg-white w-2/3 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Users growth</h3>
                
                <CustomLineChart data={lineChartData.length === 0 ?"":finallineChartData}/>
                
            </div>
        </div>

        <div className=' flex-1 flex gap-3'>

            <div className='bg-tertiary flex-1 flex flex-col rounded-2xl pt-4'>
                <div className='flex w-full text-dark_grey'>
                    <h3 className='flex-1 pl-4'>NAME</h3> 
                    <div className='flex-1 flex w-full justify-between pr-4 text-center' ><h3 className='flex-1'>STREAK</h3> <h3 className='flex-1'>POINTS</h3></div>
                    </div>
                    {
                    chartsLoading?
                    <FontAwesomeIcon icon={faCircleNotch} spin />
                    :
                    leaderboard.map((row,index)=>{
                        if(index<7)
                    return  <TableRow key={row.id} image={row.profile_photo_path} name={row.first_name+" "+row.last_name} streak={row.streak} points={row.current_xp}/>;
                    })
                    }
               
                
                    </div>

            {/* most used exercices */}
            <div className='bg-white flex-1 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Most used exercices</h3>
                <BasicBarChart  data={[
                { name: 'Bench press', value: 2 },
                { name: 'Biceps curl', value: 4 },
                { name: 'Hammer', value: 2 },
                { name: 'Shoulder press', value: 3 },
                ]}/>
            </div>
            <div className='bg-white flex-1 flex flex-col items-center justify-between'>
                <h3 className='pt-4'>Users growth</h3>
                {/* geography */}

                {pieChartData.length !== 0?<CustomPieChart data={ finalPieChartData.slice(0,3)}/>:null}
                
            </div>
        </div>
    </div>
  )
}

export default Overview