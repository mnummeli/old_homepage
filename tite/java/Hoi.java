import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Hoi extends JFrame {
	private JMenuItem sulkemisVaihtoehto=new JMenuItem("Sulje");
	private JMenu lista=new JMenu("Toiminto");
	private JMenuBar palkki=new JMenuBar();
	private JPanel tausta=new JPanel(new BorderLayout());
	private JLabel kysymys=new JLabel("Mikä sinun nimesi on? ");
	private JTextField nimi=new JTextField(20);
	private Tervehdys tervehdys=null;

	public Hoi() {
		this.setTitle("Tervehdyssovelma - Mikko Nummelin, 2008");
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
		});
		sulkemisVaihtoehto.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		lista.add(sulkemisVaihtoehto);
		palkki.add(lista);
		this.setJMenuBar(palkki);
		this.add(tausta);
		tausta.add(kysymys,BorderLayout.WEST);
		nimi.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				tervehdys=Tervehdys.getInstance();
				tervehdys.tervehdysTekstiKentta.
					setText("Hei "+nimi.getText()+".");
				tervehdys.pack();
				tervehdys.setVisible(true);
			}
		});
		tausta.add(nimi,BorderLayout.EAST);
		this.pack();
		this.setVisible(true);
	}

	public static void main(String[] args) {
		new Hoi();
	}
}

class Tervehdys extends JFrame {
	public static Tervehdys ainoaInstanssi=null;
	public JLabel tervehdysTekstiKentta;

	private Tervehdys() {
		tervehdysTekstiKentta=new JLabel();
		this.add(tervehdysTekstiKentta);
		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				ainoaInstanssi.setVisible(false);
			}
		});
	}

	public static Tervehdys getInstance() {
		if(Tervehdys.ainoaInstanssi==null) {
			ainoaInstanssi=new Tervehdys();
		}
		return Tervehdys.ainoaInstanssi;
	}
}
