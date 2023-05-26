import connection from '../connection';
import { RowDataPacket } from 'mysql2';


export const searchQuestions = (searchTerm: string): Promise<any[]> => {
  return new Promise((resolve, reject) => {
    const query = `
      SELECT * FROM help WHERE question LIKE '${searchTerm}%'
    `;

    connection.query(query, (error, results) => {
      if (error) {
        reject(error);
      } else {
        resolve(results as any[]);
      }
    });
  });
};

export const getAnswer = (questionId: string): Promise<string> => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT answer FROM help WHERE id = ${questionId}
      `;
  
      connection.query(query, (error, results) => {
        if (error) {
          reject(error);
        } else {
          const answer = (results as RowDataPacket[])[0]?.answer || '';
          resolve(answer);
        }
      });
    });
  };

  
