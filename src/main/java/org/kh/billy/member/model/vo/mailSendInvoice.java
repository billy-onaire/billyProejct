package org.kh.billy.member.model.vo;

import java.io.Serializable;

public class mailSendInvoice implements Serializable{
	private static final long serialVersionUID = 793562666012703600L;
	
	private String email;
	private String authkey;

	
	public mailSendInvoice() {}
	
	public mailSendInvoice(String email, String authkey) {
		super();
		this.email = email;
		this.authkey = authkey;

	}

	public String sendInvoiceMail(String email, String authkey) {
		String content =
				"<table class=\"wrapper\" style=\"border-collapse: collapse;table-layout: fixed;min-width: 320px;width: 100%;background-color: #fff;\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tbody><tr><td>\r\n" + 
				"      <div role=\"banner\">\r\n" + 
				"        <div class=\"preheader\" style=\"Margin: 0 auto;max-width: 560px;min-width: 280px; width: 280px;width: calc(28000% - 167440px);\">\r\n" + 
				"          <div style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table align=\"center\" class=\"preheader\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr><td style=\"width: 280px\" valign=\"top\"><![endif]-->\r\n" + 
				"            <div class=\"snippet\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 140px; width: 140px;width: calc(14000% - 78120px);padding: 10px 0 5px 0;color: #adb3b9;font-family: sans-serif;\">\r\n" + 
				"              \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td style=\"width: 280px\" valign=\"top\"><![endif]-->\r\n" + 
				"            <div class=\"webversion\" style=\"display: table-cell;Float: left;font-size: 12px;line-height: 19px;max-width: 280px;min-width: 139px; width: 139px;width: calc(14100% - 78680px);padding: 10px 0 5px 0;text-align: right;color: #adb3b9;font-family: sans-serif;\">\r\n" + 
				"              \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"header\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);\" id=\"emb-email-header-container\">\r\n" + 
				"        <!--[if (mso)|(IE)]><table align=\"center\" class=\"header\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr><td style=\"width: 600px\"><![endif]-->\r\n" + 
				"          <div class=\"logo emb-logo-margin-box\" style=\"font-size: 26px;line-height: 32px;Margin-top: 6px;Margin-bottom: 20px;color: #c3ced9;font-family: Roboto,Tahoma,sans-serif;Margin-left: 20px;Margin-right: 20px;\" align=\"center\">\r\n" + 
				"            <div class=\"logo-center\" align=\"center\" id=\"emb-email-header\"></div>\r\n" + 
				"          </div>\r\n" + 
				"        <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"      <div>\r\n" + 
				"      <div style=\"background-color: #fab336;\">\r\n" + 
				"        <div class=\"layout three-col\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-full-width\" style=\"background-color: #fab336;\"><td class=\"layout__edges\">&nbsp;</td><td style=\"width: 200px\" valign=\"top\" class=\"w160\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"Float: left;max-width: 320px;min-width: 200px; width: 320px;width: calc(72200px - 12000%);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 10px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td style=\"width: 200px\" valign=\"top\" class=\"w160\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"Float: left;max-width: 320px;min-width: 200px; width: 320px;width: calc(72200px - 12000%);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 10px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td style=\"width: 200px\" valign=\"top\" class=\"w160\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"Float: left;max-width: 320px;min-width: 200px; width: 320px;width: calc(72200px - 12000%);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 10px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <h3 class=\"size-10\" style=\"Margin-top: 0;Margin-bottom: 0;font-style: normal;font-weight: normal;color: #281557;font-size: 10px;line-height: 18px;font-family: Avenir,sans-serif;text-align: center;\" lang=\"x-size-10\"><span style=\"color:#fff\"><strong>&#48716;&#47532;&#47484; &#51060;&#50857;&#54644;&#51452;&#49492;&#49436; &#44048;&#49324;&#54633;&#45768;&#45796;</strong></span></h3>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td class=\"layout__edges\">&nbsp;</td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"background-color: #fab336;\">\r\n" + 
				"        <div class=\"layout one-col\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-full-width\" style=\"background-color: #fab336;\"><td class=\"layout__edges\">&nbsp;</td><td style=\"width: 600px\" class=\"w560\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 10px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td class=\"layout__edges\">&nbsp;</td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"  \r\n" + 
				"      <div class=\"layout one-col fixed-width\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"        <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;background-color: #ffffff;\">\r\n" + 
				"        <!--[if (mso)|(IE)]><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-fixed-width\" style=\"background-color: #ffffff;\"><td style=\"width: 600px\" class=\"w560\"><![endif]-->\r\n" + 
				"          <div class=\"column\" style=\"text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);\">\r\n" + 
				"        \r\n" + 
				"            <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 50px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"        \r\n" + 
				"            <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <h2 style=\"Margin-top: 0;Margin-bottom: 0;font-style: normal;font-weight: normal;color: #e31212;font-size: 26px;line-height: 34px;font-family: Avenir,sans-serif;text-align: center;\"><span style=\"color:#fab336\"><strong>BILLY</strong></span></h2>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"        \r\n" + 
				"          </div>\r\n" + 
				"        <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"line-height:20px;font-size:20px;\">&nbsp;</div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"background-color: #fff;\">\r\n" + 
				"        <div class=\"layout two-col\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-full-width\" style=\"background-color: #fff;\"><td class=\"layout__edges\">&nbsp;</td><td style=\"width: 300px\" valign=\"top\" class=\"w260\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"Float: left;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 25px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <h3 style=\"Margin-top: 0;Margin-bottom: 12px;font-style: normal;font-weight: normal;color: #281557;font-size: 18px;line-height: 26px;font-family: Avenir,sans-serif;\"><span style=\"color:#000000\"><strong>이용해주셔서 감사합니다</strong></span></h3>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <p style=\"Margin-top: 0;Margin-bottom: 20px;\">빌리는 항상 고객님들께 최선의 서비스를 제공하기 위해 노력하겠습니다.</p>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div class=\"divider\" style=\"display: block;font-size: 2px;line-height: 2px;Margin-left: auto;Margin-right: auto;width: 40px;background-color: #ccc;Margin-bottom: 20px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <p class=\"size-22\" style=\"Margin-top: 0;Margin-bottom: 20px;font-size: 18px;line-height: 26px;\" lang=\"x-size-22\"><strong><span style=\"color:#000000\">이메일 인증키</span></strong></p>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <p style=\"Margin-top: 0;Margin-bottom: 20px;\"><span style=\"color:#8e959c\">"+"<pre>"+ authkey +"</pre>"+"</span></p>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;mso-text-raise: 4px;\">\r\n" + 
				"        <p style=\"Margin-top: 0;Margin-bottom: 20px;\">"+ "</p>\r\n" + 
				"      </div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div class=\"divider\" style=\"display: block;font-size: 2px;line-height: 2px;Margin-left: auto;Margin-right: auto;width: 40px;background-color: #ccc;Margin-bottom: 20px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 15px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td style=\"width: 300px\" valign=\"top\" class=\"w260\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"Float: left;max-width: 320px;min-width: 300px; width: 320px;width: calc(12300px - 2000%);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 25px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td class=\"layout__edges\">&nbsp;</td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"line-height:50px;font-size:50px;\">&nbsp;</div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"background-color: #fab336;\">\r\n" + 
				"        <div class=\"layout one-col\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-full-width\" style=\"background-color: #fab336;\"><td class=\"layout__edges\">&nbsp;</td><td style=\"width: 600px\" class=\"w560\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);text-align: left;color: #8e959c;font-size: 14px;line-height: 21px;font-family: sans-serif;\">\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 50px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 15px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div class=\"btn btn--flat btn--medium\" style=\"Margin-bottom: 20px;text-align: center;\">\r\n" + 
				"        <![if !mso]><a style=\"border-radius: 4px;display: inline-block;font-size: 12px;font-weight: bold;line-height: 22px;padding: 10px 20px;text-align: center;text-decoration: none !important;transition: opacity 0.1s ease-in;color: #000000 !important;background-color: #ffffff;font-family: sans-serif;\" href=\"http://www.billy-onaire.shop/\">&#49324;&#51060;&#53944;&#47196; &#51060;&#46041;</a><![endif]>\r\n" + 
				"      <!--[if mso]><p style=\"line-height:0;margin:0;\">&nbsp;</p><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" href=\"http://www.billy-onaire.shop/\" style=\"width:115px\" arcsize=\"10%\" fillcolor=\"#FFFFFF\" stroke=\"f\"><v:textbox style=\"mso-fit-shape-to-text:t\" inset=\"0px,9px,0px,9px\"><center style=\"font-size:12px;line-height:22px;color:#000000;font-family:sans-serif;font-weight:bold;mso-line-height-rule:exactly;mso-text-raise:4px\">&#49324;&#51060;&#53944;&#47196; &#51060;&#46041;</center></v:textbox></v:roundrect><![endif]--></div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;\">\r\n" + 
				"      <div style=\"mso-line-height-rule: exactly;line-height: 35px;font-size: 1px;\">&nbsp;</div>\r\n" + 
				"    </div>\r\n" + 
				"            \r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td class=\"layout__edges\">&nbsp;</td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"  \r\n" + 
				"      <div style=\"line-height:20px;font-size:20px;\">&nbsp;</div>\r\n" + 
				"  \r\n" + 
				"      \r\n" + 
				"      <div role=\"contentinfo\">\r\n" + 
				"        <div class=\"layout email-footer\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-email-footer\"><td style=\"width: 400px;\" valign=\"top\" class=\"w360\"><![endif]-->\r\n" + 
				"            <div class=\"column wide\" style=\"text-align: left;font-size: 12px;line-height: 19px;color: #adb3b9;font-family: sans-serif;Float: left;max-width: 400px;min-width: 320px; width: 320px;width: calc(8000% - 47600px);\">\r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;\">\r\n" + 
				"                \r\n" + 
				"                <div style=\"font-size: 12px;line-height: 19px;\">\r\n" + 
				"                  <div>Billy.corp</div>\r\n" + 
				"                </div>\r\n" + 
				"                <div style=\"font-size: 12px;line-height: 19px;Margin-top: 18px;\">\r\n" + 
				"                  <div>billy@billy.co.kr</div>\r\n" + 
				"                </div>\r\n" + 
				"                <!--[if mso]>&nbsp;<![endif]-->\r\n" + 
				"              </div>\r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td><td style=\"width: 200px;\" valign=\"top\" class=\"w160\"><![endif]-->\r\n" + 
				"            <div class=\"column narrow\" style=\"text-align: left;font-size: 12px;line-height: 19px;color: #adb3b9;font-family: sans-serif;Float: left;max-width: 320px;min-width: 200px; width: 320px;width: calc(72200px - 12000%);\">\r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;\">\r\n" + 
				"                \r\n" + 
				"              </div>\r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"layout one-col email-footer\" style=\"Margin: 0 auto;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;\">\r\n" + 
				"          <div class=\"layout__inner\" style=\"border-collapse: collapse;display: table;width: 100%;\">\r\n" + 
				"          <!--[if (mso)|(IE)]><table align=\"center\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\"><tr class=\"layout-email-footer\"><td style=\"width: 600px;\" class=\"w560\"><![endif]-->\r\n" + 
				"            <div class=\"column\" style=\"text-align: left;font-size: 12px;line-height: 19px;color: #adb3b9;font-family: sans-serif;max-width: 600px;min-width: 320px; width: 320px;width: calc(28000% - 167400px);\">\r\n" + 
				"              <div style=\"Margin-left: 20px;Margin-right: 20px;Margin-top: 10px;Margin-bottom: 10px;\">\r\n" + 
				"                <div style=\"font-size: 12px;line-height: 19px;\">\r\n" + 
				"                  <unsubscribe style=\"text-decoration: underline;\">Unsubscribe</unsubscribe>\r\n" + 
				"                </div>\r\n" + 
				"              </div>\r\n" + 
				"            </div>\r\n" + 
				"          <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\r\n" + 
				"          </div>\r\n" + 
				"        </div>\r\n" + 
				"      </div>\r\n" + 
				"      <div style=\"line-height:40px;font-size:40px;\">&nbsp;</div>\r\n" + 
				"    </div></td></tr></tbody></table>";
		
		return content;
	}

}
