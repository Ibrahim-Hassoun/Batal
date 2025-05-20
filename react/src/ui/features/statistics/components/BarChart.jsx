import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend ,ResponsiveContainer} from 'recharts';



const BasicBarChart = ({data}) => {
  return (
    <div style={{ width: '80%',height:'80%' }}> {/* 👈 Controls width */}
      <ResponsiveContainer  > {/* 👈 Fills parent */}
        <BarChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="value" fill="#8884d8" />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
};

export default BasicBarChart