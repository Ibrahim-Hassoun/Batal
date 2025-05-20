import React from 'react'

const TableRow = ({image,name,streak,points}) => {
  return (
    <div className='px-4 flex mt-2 items-center'>
        <div className='flex-1 flex gap-2 items-center'><img src={image} className='h-9 w-9 rounded-full' />  <h3 className='ml-2 font-bold'>{name}</h3>  </div> 
        <div className='flex-1 flex w-full justify-between text-center' ><h3 className='flex-1 text-center'>{streak}</h3> <h3 className='flex-1'>{points}</h3></div>

    </div>
  
  )
}

export default TableRow