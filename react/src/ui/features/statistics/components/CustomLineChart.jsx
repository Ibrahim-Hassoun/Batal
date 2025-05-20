import React from 'react';
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer
} from 'recharts';



const CustomLineChart = ({data}) => {
  return (
    <div style={{ width: '100%', height: 400 }}>
      <h2 style={{ textAlign: 'center' }}>Line Chart Example</h2>
      <ResponsiveContainer width="100%" height="100%">
        <LineChart
          data={data}
          margin={{
            top: 20,
            right: 30,
            left: 20,
            bottom: 10,
          }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Line
            type="monotone"
            dataKey="value"
            stroke="#8884d8"
            activeDot={{ r: 8 }}
            name="Metrics"
          />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
};

export default CustomLineChart;