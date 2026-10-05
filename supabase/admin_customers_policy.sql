CREATE POLICY "Admin can view all customers" ON customers
  FOR SELECT USING (auth.jwt() ->> 'email' = 'info.ourcollectionbd@gmail.com');
CREATE POLICY "Admin can update all customers" ON customers
  FOR UPDATE USING (auth.jwt() ->> 'email' = 'info.ourcollectionbd@gmail.com');
